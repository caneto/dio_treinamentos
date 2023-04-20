import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/contador_service.dart';

class ContadorProviderPage extends StatelessWidget {
  const ContadorProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("build");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Contador Provider",
              style: TextStyle(fontSize: 26),
            ),
            Consumer<ContadorProviderService>(
                builder: (_, contadorService, wiidget) {
              if (kDebugMode) {
                print("Consumer");
              }
              return Text(
                contadorService.contador.toString(),
                style: const TextStyle(fontSize: 26),
              );
            }),
            TextButton(
                onPressed: () {
                  Provider.of<ContadorProviderService>(context, listen: false)
                      .incrementar();
                },
                child: const Text("Incrementar")),
          ],
        ),
      ),
    );
  }
}
