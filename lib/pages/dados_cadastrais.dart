import 'package:acad_prot/pages/principal_pageview.dart';
import 'package:acad_prot/repositories/linguagens_repository.dart';
import 'package:acad_prot/repositories/nivel_repository.dart';
import 'package:acad_prot/repositories/personal_trainer.dart';
import 'package:acad_prot/shared/widgets/menu_lateral.dart';
import 'package:acad_prot/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';


class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais(
    {super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var personalTrainerRepository = PersonalTrainerRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;
  String personalTrainer = "";


  bool salvando = false;


  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    
    super.initState();
  }

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> personalTrainer = [
    const DropdownMenuItem(child: Text("José"),value: "Jose"),
    const DropdownMenuItem(child: Text("Maria"),value: "Maria"),
    const DropdownMenuItem(child: Text("Felipe"),value: "Felipe"),
    const DropdownMenuItem(child: Text("Fátima"),value: "Fatima"),
    const DropdownMenuItem(child: Text("Sem personal trainer"),value: "NA"),
  ];
  return personalTrainer;
}


  List<DropdownMenuItem<int>> returnItens(int quantidadeMax) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMax; i++) {
      itens.add(
        DropdownMenuItem(
                    value: i,
                    child: Text(i.toString() + " dia(s)")
                  ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dados cadastrais")),
      drawer: const Gaveta(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando ? const Center(
          child: CircularProgressIndicator()) 
        : ListView(
          children: [
           const TextLabel(texto: "Nome"),
              TextField(
                controller: nomeController,
              ),
            const TextLabel(texto: "Data de nascimento"),
              TextField(
                controller: dataNascController,
                readOnly: true,
                onTap: () async {
                 var data = await showDatePicker(
                    context: context, 
                    initialDate: DateTime(2000, 1, 1), 
                    firstDate: DateTime(1900, 1, 1), 
                    lastDate: DateTime.now());
                  if (data != null) {
                    dataNascController.text = data.toString();
                    dataNascimento = data;
                  }
                }),
            const TextLabel(texto: "Nivel de experiência"),
            Column(children: 
            niveis.map((nivel) => RadioListTile(
              title: Text(nivel.toString()),
              selected: nivelSelecionado == nivel,
              value: nivel.toString(), 
              groupValue: nivelSelecionado, 
              onChanged: (value) {
                setState(() {
                  nivelSelecionado = value.toString();  
                });              
              })).toList()
              ),
            const TextLabel(texto: "Modelidade"),
            Column(
              children: linguagens.map((linguagem) => CheckboxListTile(
                  title: Text(linguagem),
                  value: linguagensSelecionadas.contains(linguagem), 
                  onChanged: (bool? value) {
                    if (value!) {
                      setState(() {
                      linguagensSelecionadas.add(linguagem);
                       });
                    } else {
                      setState(() {
                      linguagensSelecionadas.remove(linguagem);
                       });
                    }
                  })).toList()
              ),
              const TextLabel(texto: "Dias da semana"),
               DropdownButton(
                value: tempoExperiencia,
                isExpanded: true,
                items: returnItens(7), 
                onChanged: (value) {
                  setState(() {
                    tempoExperiencia = int.parse(value.toString());
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            const TextLabel(texto: "Personal Trainer"),
                DropdownButton(
                    value: personalTrainer,
                    isExpanded: true,
                    items: dropdownItems, 
                    onChanged: (String? newValue) {
                      setState(() {
                        personalTrainer = newValue!;
                      });
                    },
                    ),
                 
               
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                salvando = false; 
              });
              if (nomeController.text.trim().length <= 1) {
                 ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: 
                              Text("Preencha o campo Nome do aluno"))
                          );
                          return;
                }
              if (dataNascimento == null) {
                 ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: 
                              Text("Preencha o campo Data de nascimento do aluno"))
                          );
                          return;
                }
              if (nivelSelecionado.trim() == '') {
                 ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: 
                              Text("Selecionar nível de experiência do aluno"))
                          );
                          return;
                }
              if (linguagensSelecionadas.isEmpty) {
                 ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: 
                              Text("Escolha uma modalidade do aluno"))
                          );
                          return;
                }
              if (tempoExperiencia == 0) {
                 ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: 
                              Text("Quantos dias o aluno irá treinar?"))
                          );
                          return;
                }

              setState(() {
                salvando = true; 
              });
              Future.delayed(const Duration(seconds: 1), () {
                ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: 
                              Text("Usuário cadastrado")));
                setState(() {
                salvando = false; 
              });
              Navigator.pushReplacement(
                            context, 
                              MaterialPageRoute(
                                builder: (context) => const Pageview1()));
              } );

              
              
            }, 
            child: const Text("Salvar"))
          ],
          
        ),
      )
    );
  }
}