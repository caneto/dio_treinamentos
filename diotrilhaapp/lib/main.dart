import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:trilhaapp/app/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/app/model/lista_tarefa_store.dart';
import 'package:trilhaapp/app/model/tarefa_hive_model.dart';
import 'package:trilhaapp/app/repositories/comments/comments_dio_repository.dart';
import 'package:trilhaapp/app/repositories/comments/comments_repository.dart';
import 'package:trilhaapp/app/repositories/jsonplaceholder_custon_dio.dart';
import 'package:trilhaapp/app/repositories/posts/posts_dio_repository.dart';
import 'package:trilhaapp/app/repositories/posts/posts_repository.dart';
import 'package:trilhaapp/app/services/counter_mobx_service.dart';
import 'app/my_app.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

setupGetIt() {
  getIt.registerSingleton<CounterMobXService>(CounterMobXService());
  getIt.registerSingleton<JsonPlaceHolderCustonDio>(JsonPlaceHolderCustonDio());
  //getIt.registerSingleton<PostsRepository>(
  //    PostsDioRepository(getIt<JsonPlaceHolderCustonDio>()));
  //getIt.registerSingleton<CommentsRepository>(
  //    CommentsDioRepsositoy(getIt<JsonPlaceHolderCustonDio>()));
  getIt.registerSingleton<ListaTarefasStore>(ListaTarefasStore());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());

  setupGetIt();

  runApp( 
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('pt', 'BR'),
        child: const MyApp()),
  );
}
