import 'package:flutter/material.dart';

import '../repository/model/viacep_model.dart';
import '../repository/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({Key? key}) : super(key: key);

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viacepModel = ViaCEPModel();
  var viaCEPRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Busca CEP"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(17, 1, 7, 1),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: cepController,
                    decoration: const InputDecoration(
                        labelText: "Insira um CEP",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    onChanged: (String value) async {
                      var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                      if (cep.length == 8) {
                        setState(() {
                          loading = true;
                        });
                        viacepModel = await viaCEPRepository.consultarCEP(cep);
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                  ),
                ),
                
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            viacepModel.logradouro ?? "",
            style: const TextStyle(fontSize: 22),
          ),
          Text(
            "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
            style: const TextStyle(fontSize: 22),
          ),
          if (loading) const CircularProgressIndicator()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {},
      ),
    ));
  }
}
