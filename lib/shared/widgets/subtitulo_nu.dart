import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtituloNu extends StatelessWidget {
  const SubtituloNu({super.key, required this.texto, required this.cor});
  final String texto;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:10),
      child: Text(texto,
              style:  GoogleFonts.getFont('Gothic A1',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: cor
                    )
                    ),
    );
  }
}