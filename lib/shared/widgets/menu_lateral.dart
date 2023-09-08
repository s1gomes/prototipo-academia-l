import 'package:acad_prot/pages/dados_cadastrais.dart';
import 'package:acad_prot/pages/login_page.dart';
import 'package:acad_prot/pages/principal_pageview.dart';
import 'package:acad_prot/shared/widgets/botoes_menu_lateral.dart';
import 'package:flutter/material.dart';


class Gaveta extends StatefulWidget {
  const Gaveta({super.key});

  @override
  _Gaveta createState() => _Gaveta();

}

class _Gaveta extends State<Gaveta> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             InkWell(
              onTap:() {
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(Icons.camera_alt)
                        ),
                        ListTile(
                           onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.photo_library)
                        ),
                      ],
                    );
                  });
              },
               child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 2, 2)
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: 
                  Image(
                    image: AssetImage('assets/images/academia.jpg'))),
                accountName: Text("User"), 
                accountEmail:  Text("Email")),
             ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text("ACADEMIA", 
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700
                 )),
            ),
               
            const Divider(
              color: Color.fromARGB(105, 237, 223, 223)
            ),
            const SizedBox(
              height: 10,
            ),
            const BotoesMenuLateral(
              rota: DadosCadastrais(), 
              texto: "Cadastrar aluno", 
              corIcone: Colors.black, 
              icone: Icons.card_membership),
            const Divider(
              color: Color.fromARGB(105, 237, 223, 223)
            ),
            const SizedBox(
              height: 10,
            ),
            const BotoesMenuLateral(
              rota: Pageview1(), 
              texto: "Acompanhamento", 
              corIcone: Colors.black, 
              icone: Icons.api_outlined),
            const Divider(
              color: Color.fromARGB(105, 237, 223, 223)
            ),
            const SizedBox(
              height: 10,
            ),
            
              const BotoesMenuLateral(
              rota: Login(), 
              texto: "Pagina de Login", 
              corIcone: Colors.black, 
              icone: Icons.food_bank),
            const Divider(
              color: Color.fromARGB(105, 237, 223, 223)
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell
            (
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: double.infinity,
                height: 30,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app_rounded),
                    SizedBox(width: 10),
                    Text("Sair",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                  ],
                ),
              ),
              onTap: () {
                showDialog(
                  context: context, 
                  builder: (BuildContext bc) {
                      return AlertDialog(
                        alignment: Alignment.centerLeft,

                        title: const Text("Sair do aplicativo?"),
                        content: const Wrap(
                          children: [
                            Text("Confirmar saída"),
                          ],
                        ),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: const Text("Voltar")),
                        TextButton(onPressed: () {
                          signOut();
                        }, child: const Text("Sair"))
                      ],
                      );
                  });
                },
            ),
            const Divider(
              color: Color.fromARGB(105, 237, 223, 223)
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        
        ),
      );
  }
  signOut() {
  Navigator.pushReplacement(context, 
      MaterialPageRoute(
        builder: (context) => const Login()));
  }
}
