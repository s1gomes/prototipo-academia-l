import 'package:acad_prot/data/models/card_detail_model.dart';
import 'package:acad_prot/pages/card_detail.dart';
import 'package:acad_prot/repositories/card_detail_repository.dart';
import 'package:acad_prot/shared/widgets/card_peq_descricao.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_application_teste/shared/widgets/subtitulo_nu.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  
  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null 
          ? const Center(
            child: CircularProgressIndicator()
          
          ) 
          : InkWell(
            onTap:() {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CardDetailPage(
                            cardDetail: cardDetail!,
                          )));
            },
            child: Hero(
              tag: cardDetail!.id,
              child: CardPeqDescricao(
                miniImagemCard: cardDetail!.url,
                tituloCard: cardDetail!.title,
                subtituloCard: cardDetail!.subtitle,
                textoDescritivoCard: cardDetail!.text,
               
              ),
            ),
          ),
        ),
      ]
    );
  }
}