import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trilhaapp/app/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:trilhaapp/app/pages/dados_cadastrais/dados_cadastrais_hive.dart';
import 'package:trilhaapp/app/pages/login_page.dart';
import 'package:trilhaapp/app/pages/numeros_aleatorios/numeros_aleatorios_hide_page.dart';
import 'package:trilhaapp/app/pages/percent_indicator/percent_indicator_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../pages/auto_size_text/auto_size_text_page.dart';
import '../../pages/characters/characters_page.dart';
import '../../pages/posts_page.dart';
import '../../pages/tarefa_page/tarefa_http_page.dart';
import 'expansion_tile_widget.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const Text("Camera"),
                        leading: const Icon(Icons.camera_alt),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: const Text("Galeria"),
                        leading: const Icon(Icons.insert_photo),
                      )
                    ],
                  );
                },
              );
            },
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.orange.shade400),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                accountName: const Text("Usuario de Teste"),
                accountEmail: const Text("email@email.com")),
          ),
          Expanded(
            child: ListView(
              children: [
                ExpansionTileWidget(
                  expansionTile: 'Pacotes',
                  expansionSubTile: 'Pacotes',
                  children: [
                    ListTile(
                      onTap: () async {
                        await launchUrl(Uri.parse("https://dio.me"));
                      },
                      title: const Text('Abrir dio'),
                      leading: const FaIcon(
                        FontAwesomeIcons.internetExplorer,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        await launchUrl(
                            Uri.parse("google.navigation:q=Orlando FL&mode=d"));
                      },
                      title: const Text('Abrir Google Maps'),
                      leading: const FaIcon(
                        FontAwesomeIcons.mapLocationDot,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Share.share(
                          'Olhem esse site, que legal! https://dio.me',
                        );
                      },
                      title: const Text('Comaprtilhar'),
                      leading: const FaIcon(
                        FontAwesomeIcons.shareNodes,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PercentIndicatorPage(),
                          ),
                        );
                      },
                      title: const Text('Indicador de porcentagem'),
                      leading: const FaIcon(
                        FontAwesomeIcons.percent,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AutoSizeTextPage()));
                      },
                      title: const Text('Auto Size Text'),
                      leading: const FaIcon(
                        FontAwesomeIcons.paperclip,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 4),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.person),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Dados cadastráis"),
                        ],
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DadosCadastraisHivePage()));
                  },
                ),
                const Divider(),
                const SizedBox(height: 4),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.info),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Termos de uso e privacidade"),
                        ],
                      )),
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        context: context,
                        builder: (BuildContext bc) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            child: Column(
                              children: const [
                                Text(
                                  "Termos de uso e privacidade",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Do mesmo modo, o entendimento das metas propostas prepara-nos para enfrentar situações atípicas decorrentes do sistema de formação de quadros que corresponde às necessidades. Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se a consolidação das estruturas acarreta um processo de reformulação e modernização dos conhecimentos estratégicos para atingir a excelência. Assim mesmo, a revolução dos costumes deve passar por modificações independentemente dos índices pretendidos. Não obstante, a percepção das dificuldades apresenta tendências no sentido de aprovar a manutenção do retorno esperado a longo prazo.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
                const Divider(),
                const SizedBox(height: 4),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.numbers),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Gerador de números"),
                        ],
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (bc) => const NumerosAleatoriosHivePage(),
                      ),
                    );
                  },
                ),
                const Divider(),
                const SizedBox(height: 4),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.album),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Configurações"),
                        ],
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (bc) => const ConfiguracoesHivePage()));
                  },
                ),
                const Divider(),
                const SizedBox(height: 4),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.post_add),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Posts"),
                        ],
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (bc) => const PostsPage()));
                  },
                ),
                const Divider(),
                const SizedBox(height: 4),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.image_sharp),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Herois"),
                        ],
                      )),
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (bc) => const CharactersPage()));
                  },
                ),
                const Divider(),
                const SizedBox(height: 4),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.help),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Tarefas HTTP"),
                        ],
                      )),
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (bc) => const TarefaHttpPage()));
                  },
                ),
                const Divider(),
                const SizedBox(height: 5),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.exit_to_app),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Sair"),
                        ],
                      )),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext bc) {
                        return AlertDialog(
                          alignment: Alignment.centerLeft,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: const Text(
                            "Meu App",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: Wrap(
                            children: const [
                              Text("Voce sairá do aplicativo!"),
                              Text("Deseja realmente sair do aplicativo?"),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Não")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                child: const Text("Sim"))
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
