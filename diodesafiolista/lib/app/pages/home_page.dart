import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/app/pages/consulta_cep.dart';
import 'package:trilhaapp/app/pages/dados_cadastrais_page.dart';
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
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
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
      body: TabBarView(
        controller: tabController,
        children: const [
          ConsultaCEP(),
          DadosCadastraisPage()
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        const {},
        items: const [
          TabItem(icon: Icons.home, title: 'Card'),
          TabItem(icon: Icons.card_giftcard, title: 'Cadastro'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
