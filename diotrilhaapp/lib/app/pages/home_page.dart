import 'package:flutter/material.dart';
import 'package:trilhaapp/app/pages/consulta_cep.dart';
import 'package:trilhaapp/app/pages/list_view_horizontal.dart';
import 'package:trilhaapp/app/shared/widgets/custom_drawer.dart';

import 'card_page.dart';
import 'image_assets.dart';
import 'list_view.dart';
import 'tarefa_page/tarefa_sqlite_page.dart';

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
      drawer: const SafeArea(
        child: CustonDrawer(),
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
                ConsultaCEP(),
                CardPage(),
                ImageAssetsPage(),
                ListViewPage(),
                ListViewHorizontal(),
                TarefaSQLitePage()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          controller.jumpToPage(value);
        },
        currentIndex: posicaoPagina,
        items: const [
          BottomNavigationBarItem(
            label: "HTTP",
            icon: Icon(Icons.get_app_rounded),
          ),
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
          ),
          BottomNavigationBarItem(
            label: "Pag4",
            icon: Icon(Icons.image),
          ),
          BottomNavigationBarItem(
            label: "Tarefas",
            icon: Icon(Icons.list),
          )
        ],
      ),
    );
  }
}
