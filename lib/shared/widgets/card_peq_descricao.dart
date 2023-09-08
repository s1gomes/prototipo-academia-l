import 'package:acad_prot/shared/widgets/subtitulo_nu.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CardPeqDescricao extends StatelessWidget {
  const CardPeqDescricao({super.key, required this.miniImagemCard, required this.tituloCard, required this.subtituloCard, required this.textoDescritivoCard});
  final String miniImagemCard;
  final String tituloCard;
  final String subtituloCard;
  final String textoDescritivoCard;



  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 8,
            shadowColor: Colors.purple,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      Image(image: AssetImage(miniImagemCard),
                      height: 35
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SubtituloNu(texto: tituloCard,
                        cor: Colors.black
                        ),
                      )
                    ],
                  ),
                    Text(subtituloCard,
                    style: const TextStyle(
                      fontSize: 17
                    ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(textoDescritivoCard,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 15
                    )),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: const Text("Ler mais",
                      style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                ],
              ),
            ),
          );
  }
}