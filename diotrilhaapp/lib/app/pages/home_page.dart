import 'package:flutter/material.dart';

import 'dados_cadastrais_page.dart';
import 'pagina1.dart';
import 'pagina2.dart';
import 'pagina3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          //style: GoogleFonts.fasterOne(),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Dados cadastráis")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DadosCadastraisPage(),
                      ),
                    );
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Termos de uso e privacidade")),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Configurações")),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
              },
              children: const [
                Pagina1Page(),
                Pagina2Page(),
                Pagina3Page(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          controller.jumpToPage(value);
        },
        currentIndex: posicaoPagina,
        items: const [
          BottomNavigationBarItem(
            label: "Pag1",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Pag2",
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "Pag3",
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
