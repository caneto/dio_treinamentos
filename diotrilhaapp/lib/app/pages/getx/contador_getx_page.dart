import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trilhaapp/app/services/contador_get_controller.dart';

class ContadorGetXPage extends StatelessWidget {
  ContadorGetXPage({super.key});
  var contadorGetXService = ContadorGetController();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("build");
    }
    return Scaffold(
       appBar: AppBar(
        title: const Text("Contador GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Contador GetX",
              style: TextStyle(fontSize: 26),
            ),
            Obx(() {
              return Text(
                "${contadorGetXService.contador}",
                style: const TextStyle(fontSize: 26),
              );
            }),
            TextButton(
                onPressed: () {
                  contadorGetXService.incrementar();
                },
                child: const Text("Incrementar")),
          ],
        ),
      ),
    );
  }
}