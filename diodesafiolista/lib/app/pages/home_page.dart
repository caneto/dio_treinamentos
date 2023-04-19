import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/app/pages/consulta_cep.dart';
import 'package:trilhaapp/app/pages/list_view_horizontal.dart';
import 'package:trilhaapp/app/shared/widgets/custom_drawer.dart';

import 'brasil_fields_page/brasil_fields_page.dart';
import 'card_page.dart';
import 'image_assets.dart';
import 'list_view.dart';
import 'tarefa_page/tarefa_sqlite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //PageController controller = PageController(initialPage: 0);
  late TabController tabController;

  //int posicaoPagina = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 6, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
      /* body: Column(
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
      ), */
      body: TabBarView(
        controller: tabController,
        children: [
          const ConsultaCEP(),
          CardPage(),
          const ImageAssetsPage(),
          const ListViewPage(),
          const ListViewHorizontal(),
          const TarefaSQLitePage()
        ],
      ),
      /* bottomNavigationBar: BottomNavigationBar(
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
      ), */
      bottomNavigationBar: ConvexAppBar.badge(
        const {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        items: const [
          TabItem(icon: Icons.get_app_rounded, title: 'Http'),
          TabItem(icon: Icons.home, title: 'Card'),
          TabItem(icon: Icons.add, title: 'Imagem'),
          TabItem(icon: Icons.line_style, title: 'ListView'),
          TabItem(icon: Icons.list, title: 'ListView2'),
          TabItem(icon: Icons.image, title: 'Tarefas'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
