

import 'package:acad_prot/data/models/card_detail_model.dart';

class CardDetailRepository {

  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
      1,
      'assets/images/eptus_logo.jpg',
      "Publicação de artigo",
      "Abstrato",
      "More energy-consuming devices such as household electronics and more production facilities worldwide are causing increases in electricity demand and energy prices. The public service has difficulty maintaining the energy balance. These problems can be overcome by rapidly transforming the traditional electricity grid into a smart grid (SG) infrastructure.",
  );
  }

}