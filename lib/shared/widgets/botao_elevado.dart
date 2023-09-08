import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../pages/pageview1.dart';
//import 'package:flutter_application_teste/shared/widgets/iconeBotoes.dart';

class BotaoElevado extends StatelessWidget {
  const BotaoElevado({super.key, required this.texto, required this.corTexto, required this.corBack, required this.corIcone, required this.icone, required this.rotaBotaoElevado});
  final String texto;
  final Color corTexto;
  final Color corBack;
  final Color corIcone;
  final IconData icone;
  final Widget rotaBotaoElevado;
  //final Color corIcone;required this.corIcone
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          color: corBack,
          ),
        margin: const EdgeInsets.all(20),
        height: 140,
        width: 155,
    
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: 
               Icon(
                  icone, 
                  color: corIcone,
                  size: 30
                  ),
             ),
           ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 0, bottom: 10, right: 10),
            child: Text(texto,
                textAlign: TextAlign.left,
                style:  GoogleFonts.getFont('Gothic A1',
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: corTexto,
                )),
          ),
        ])
      ),
       onTap: () {
        Navigator.pushReplacement(
        context, 
          MaterialPageRoute(
            builder: (context) => rotaBotaoElevado));
       }
);
  }
}