import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:trilhaapp/app/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/app/model/tarefa_hive_model.dart';
import 'app/my_app.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());
  runApp(const MyApp());
}

