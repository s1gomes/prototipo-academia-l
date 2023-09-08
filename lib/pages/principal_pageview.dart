import 'package:acad_prot/pages/card_page.dart';
import 'package:acad_prot/pages/tarefa_page.dart';
import 'package:acad_prot/shared/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';


class Pageview1 extends StatefulWidget {
  const Pageview1 ({Key? key}) : super(key: key);

  @override
  State<Pageview1> createState() => _PageView1();
}

class _PageView1 extends State<Pageview1> {
  PageController controller = PageController(initialPage: 0);
  var _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Gaveta(),
      appBar: AppBar(
        title: const Text("Page Hall", 
        style: TextStyle(color: Color.fromARGB(255, 150, 140, 140), fontFamily: 'Raleway'), 
        ),
      ),
      body: 
        Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                children: const [
                  
                  CardPage(),
                  TarefaPage()
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              label: "Treino",
              icon: 
              Icon(Icons.sports_gymnastics)
              ),
               BottomNavigationBarItem(
              label: "Acompanhamento",
              icon: 
              Icon(Icons.description)
              ),
              BottomNavigationBarItem(
              label: "Tarefas",
              icon: 
              Icon(Icons.home_work_outlined)
              )
            ],
          
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 118, 11, 11),
          onTap: (value) {
            controller.jumpToPage(value);
        },
      ),
    );
  }
}