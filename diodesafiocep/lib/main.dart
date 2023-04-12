import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  //var documentsDirectory =
  //    await path_provider.getApplicationDocumentsDirectory();
  //Hive.init(documentsDirectory.path);
  //Hive.registerAdapter(DadosCadastraisModelAdapter());
  //Hive.registerAdapter(TarefaHiveModelAdapter());
  runApp(const MyApp());
}
