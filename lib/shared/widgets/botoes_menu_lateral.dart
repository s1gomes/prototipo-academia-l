import 'package:flutter/material.dart';

class BotoesMenuLateral extends StatelessWidget {
  const BotoesMenuLateral({super.key, required this.rota, required this.texto, required this.corIcone, required this.icone});
  final Widget rota;
  final String texto;
  final Color corIcone;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: double.infinity,
                  height: 30,
                  child: Row(
                    children: [
                      Icon(icone,
                      color: corIcone),
                      const SizedBox(width: 10),
                      Text(texto,
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                    ],
                  ),
                ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context, 
                          MaterialPageRoute(
                            builder: (context) => rota));
                  },
               );
  }
}