import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trilhaapp/app/pages/splash_screen/splash_screen_delay_page.dart';
import 'package:trilhaapp/app/repositories/tarefa_repository_changenotifier.dart';
import 'package:trilhaapp/app/services/dark_mode_service.dart';

import 'services/contador_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<DarkModeService>(
              create: (_) => DarkModeService()),
          ChangeNotifierProvider<ContadorProviderService>(
              create: (_) => ContadorProviderService()),
          ChangeNotifierProvider<TarefaRepository>(
              create: (_) => TarefaRepository())
        ],
        child: Consumer<DarkModeService>(builder: (_, darkModeService, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            //theme: ThemeData(
            //    primarySwatch: Colors.blue,
            //    textTheme: GoogleFonts.robotoTextTheme()),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme:
                darkModeService.darkMode ? ThemeData.dark() : ThemeData.light(),
            home: const SplashScreenDelayPage(),
          );
        }),
      ),
    );
  }
}
