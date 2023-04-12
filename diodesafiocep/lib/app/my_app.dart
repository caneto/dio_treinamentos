import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:busca_cep_list/app/pages/consulta_cep.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.robotoTextTheme()),
        home: const ConsultaCEP(),
      ),
    );
  }
}
