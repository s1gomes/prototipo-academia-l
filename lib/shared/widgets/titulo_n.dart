import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TituloN extends StatelessWidget {
  const TituloN({super.key, required this.texto});
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:15),
      child: Text(texto,
              textAlign: TextAlign.left,
              style: GoogleFonts.getFont('Gothic A1',
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 46, 19, 91)
                )
              ),
    );
  }
}