import 'package:acad_prot/data/models/card_detail_model.dart';
import 'package:acad_prot/shared/widgets/menu_lateral.dart';
import 'package:acad_prot/shared/widgets/subtitulo_nu.dart';
import 'package:flutter/material.dart';


class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage ({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Gaveta(),
        // appBar: AppBar(
        //   title: const Text("Detalhes", 
        //   style: TextStyle(color: Color.fromARGB(255, 150, 140, 140), fontFamily: 'Raleway'), 
        //   )),
        body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                     Column(
                      children: [
                        Image(image: AssetImage(cardDetail.url),
                        height: 100
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SubtituloNu(texto: cardDetail.title,
                          cor: Colors.black
                          ),
                        )
                      ],
                    ),
                      Text(cardDetail.subtitle,
                      style: const TextStyle(
                        fontSize: 20
                      ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        child: Text(cardDetail.text,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 17
                        )
                       ),
                      ),
                  ],
                ),
              ),  
              floatingActionButton: FloatingActionButton(onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: const Icon(Icons.close_outlined)
                      ),   
      ),
    );
  }
}