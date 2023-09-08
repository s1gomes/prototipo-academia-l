import 'package:acad_prot/pages/dados_cadastrais.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const SizedBox(
                  height: 50,
                ),     
                Row(
                  children: [
                    Expanded(child: Container()),
                     const Expanded(
                      flex: 8,
                      child: Image(image: AssetImage('assets/images/academia.jpg'),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text("Academia",
                      style: GoogleFonts.getFont('Gothic A1',
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                    )),
                const SizedBox(
                  height: 15,
                ),
                 Text("Faça seu login",
                      style: GoogleFonts.getFont('Gothic A1',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                    )
                      ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 40,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                     debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        )),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person, 
                        color: Colors.white,)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 40,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: senhaController,
                    obscureText: isObscureText,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        )),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                      ),
                      hintText: "Senha",
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.lock, 
                        color: Colors.white,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                            
                          },
                          child: Icon(
                            isObscureText 
                              ? Icons.visibility_off 
                              : Icons.visibility,
                              color: Colors.white
                          ),
                        ),
                        
                        ),
                  ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  alignment: Alignment.center,
                  
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                     onPressed: () {
                      if (
                        emailController.text.trim() == "email@gmail.com" &&
                        senhaController.text.trim() == "123") {
                          Navigator.pushReplacement(
                            context, 
                              MaterialPageRoute(
                                builder: (context) => const DadosCadastrais()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Erro ao efetuar o login"))
                          );
                        }
                     }, 
                     style: ButtonStyle( 
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 155, 123, 48))
                     ),
                     child: const Text("Entrar",
                     style: TextStyle(color: Colors.white, 
                     fontSize: 16, 
                     fontWeight: FontWeight.w600),
                     )),
                  ),
                  ),
                Expanded(child: Container()),
                
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 20,
                  alignment: Alignment.center,
                  child: const Text("Esqueci minha senha",
                      style: TextStyle(
                        color: Color.fromARGB(255, 204, 190, 232),
                        fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}