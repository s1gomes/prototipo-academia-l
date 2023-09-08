import 'package:acad_prot/pages/dados_cadastrais.dart';
// import 'package:acad_prot/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Academia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 248, 245, 197)),
        useMaterial3: true,
      ),
      home: const DadosCadastrais()
    );
  }
}
