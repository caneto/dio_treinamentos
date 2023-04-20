import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trilhaapp/app/pages/battery/battery_page.dart';
import 'package:trilhaapp/app/pages/brasil_fields_page/brasil_fields_page.dart';
import 'package:trilhaapp/app/pages/camera/camera_page.dart';
import 'package:trilhaapp/app/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:trilhaapp/app/pages/connectivity_plus/connectivity_plus_page.dart';
import 'package:trilhaapp/app/pages/dados_cadastrais/dados_cadastrais_hive.dart';
import 'package:trilhaapp/app/pages/geolocator/geolocator_page.dart';
import 'package:trilhaapp/app/pages/login_page.dart';
import 'package:trilhaapp/app/pages/numeros_aleatorios/numeros_aleatorios_hide_page.dart';
import 'package:trilhaapp/app/pages/percent_indicator/percent_indicator_page.dart';
import 'package:trilhaapp/app/pages/provider/contador_provider_page.dart';
import 'package:trilhaapp/app/pages/qr_code/qr_code_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

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
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const BrasilFieldsPage()));
                      },
                      title: const Text('Brasil Fields Page'),
                      leading: const FaIcon(
                        FontAwesomeIcons.brazilianRealSign,
                        color: Colors.green,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        var f = NumberFormat('#,###.0#', 'en_US');
                        var fBR = NumberFormat('#,###.0#', 'pt_BR');
                        if (kDebugMode) {
                          print(f.format(12345.345));
                        }
                        if (kDebugMode) {
                          print(fBR.format(123456.345));
                        }

                        var data = DateTime(2022, 05, 09);
                        if (kDebugMode) {
                          print(DateFormat('EEEEE', 'en_US').format(data));
                        }
                        if (kDebugMode) {
                          print(DateFormat('EEEEE', 'pt_BR').format(data));
                        }

                        Intl.defaultLocale = 'pt_BR';
                        if (kDebugMode) {
                          print(data.toString());
                        }
                      },
                      title: const Text('Intl'),
                      leading: const FaIcon(
                        FontAwesomeIcons.house,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        if (context.locale.toString() == "pt_BR") {
                          context.setLocale(const Locale('en', 'US'));
                        } else {
                          context.setLocale(const Locale('pt', 'BR'));
                        }
                        Navigator.pop(context);
                      },
                      title: const Text('Pt-Br'),
                      leading: const FaIcon(
                        FontAwesomeIcons.flag,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BatteryPage(),
                          ),
                        );
                      },
                      title: const Text('Indicador da bateria'),
                      leading: const FaIcon(
                        FontAwesomeIcons.batteryHalf,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        var directory =
                            await path_provider.getTemporaryDirectory();
                        if (kDebugMode) {
                          print(directory.path);
                        }
                        directory = await path_provider
                            .getApplicationSupportDirectory();
                        if (kDebugMode) {
                          print(directory.path);
                        }
                        directory = await path_provider
                            .getApplicationDocumentsDirectory();
                        if (kDebugMode) {
                          print(directory.path);
                        }
                      },
                      title: const Text('Path'),
                      leading: const FaIcon(
                        FontAwesomeIcons.flag,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        PackageInfo packageInfo =
                            await PackageInfo.fromPlatform();

                        String appName = packageInfo.appName;
                        String packageName = packageInfo.packageName;
                        String version = packageInfo.version;
                        String buildNumber = packageInfo.buildNumber;

                        if (kDebugMode) {
                          print(appName);
                          print(packageName);
                          print(version);
                          print(buildNumber);
                          print(Platform.operatingSystem);
                        }
                      },
                      title: const Text('Informações pacote'),
                      leading: const FaIcon(
                        FontAwesomeIcons.appStoreIos,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                        if (Platform.isAndroid) {
                          AndroidDeviceInfo androidInfo =
                              await deviceInfo.androidInfo;
                          if (kDebugMode) {
                            print('Running on ${androidInfo.model}');
                          } // e.g. "Moto G (4)"
                        } else if (Platform.isIOS) {
                          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                          if (kDebugMode) {
                            print('Running on ${iosInfo.utsname.machine}');
                          } // e.g. "iPod7,1"
                        } else {
                          WebBrowserInfo webBrowserInfo =
                              await deviceInfo.webBrowserInfo;
                          if (kDebugMode) {
                            print('Running on ${webBrowserInfo.userAgent}');
                          }
                        }
                      },
                      title: const Text('Informações dispositivo'),
                      leading: const FaIcon(
                        FontAwesomeIcons.robot,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ConnectivityPlusPage(),
                          ),
                        );
                      },
                      title: const Text('Conexão'),
                      leading: const FaIcon(
                        FontAwesomeIcons.wifi,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const GeolocatorPage(),
                          ),
                        );
                      },
                      title: const Text('GeoLocalization GPS'),
                      leading: const FaIcon(
                        FontAwesomeIcons.mapPin,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const QrCodePage(),
                          ),
                        );
                      },
                      title: const Text('QR Code'),
                      leading: const FaIcon(
                        FontAwesomeIcons.qrcode,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CameraPage(),
                          ),
                        );
                      },
                      title: const Text('Camera'),
                      leading: const FaIcon(
                        FontAwesomeIcons.camera,
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
                    const SizedBox(height: 4),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.countertops),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Contador com Provider"),
                        ],
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ContadorProviderPage()));
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
