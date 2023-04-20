import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trilhaapp/app/services/count_mobx_store.dart';

class ContadorMobXStorePage extends StatelessWidget {
  ContadorMobXStorePage({super.key});
  CounterMobXSore contadorMobXStore = CounterMobXSore();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("build");
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador MobX Store",
          style: TextStyle(fontSize: 26),
        ),
        Observer(builder: (context) {
          return Text(
            "${contadorMobXStore.contador}",
            style: const TextStyle(fontSize: 26),
          );
        }),
        TextButton(
            onPressed: () {
              contadorMobXStore.incrementar();
            },
            child: const Text("Incrementar")),
      ],
    );
  }
}