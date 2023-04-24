// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trilhaapp/app/services/counter_mobx_service.dart';
import 'package:trilhaapp/main.dart';

class ContadorMobXPage extends StatelessWidget {
  ContadorMobXPage({super.key});
  CounterMobXService contadorMobXService = getIt<CounterMobXService>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("build");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador Mobx"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Contador MobX",
              style: TextStyle(fontSize: 26),
            ),
            Observer(builder: (context) {
              return Text(
                "${contadorMobXService.contador}",
                style: const TextStyle(fontSize: 26),
              );
            }),
            TextButton(
                onPressed: () {
                  contadorMobXService.incrementar();
                },
                child: const Text("Incrementar")),
          ],
        ),
      ),
    );
  }
}