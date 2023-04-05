import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/app/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme()
      ),
      localizationsDelegates: const [
         GlobalMaterialLocalizations.delegate
       ],
       supportedLocales: const [
         Locale('pt'),
       ],
      home: const LoginPage(),
    );
  }
}
