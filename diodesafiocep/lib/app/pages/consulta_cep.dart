import 'package:busca_cep_list/app/repository/back4app/cep_back4app_repository.dart';
import 'package:flutter/material.dart';

import '../repository/model/cep_back4app_model.dart';
import '../repository/model/viacep_model.dart';
import '../repository/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({Key? key}) : super(key: key);

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  CepBack4AppRepositoy cepBack4AppRepository = CepBack4AppRepositoy();
  var _cepsBack4App = CepsBack4AppModel([]);
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viacepModel = ViaCEPModel();
  var viaCEPRepository = ViaCepRepository();

  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterCeps();
  }

  void obterCeps() async {
    setState(() {
      carregando = true;
    });
    _cepsBack4App = await cepBack4AppRepository.obterCep('');
    setState(() {
      carregando = false;
    });
  }

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
                        _cepsBack4App =
                            await cepBack4AppRepository.obterCep(cep);
                        if (_cepsBack4App.ceps.isEmpty) {
                          var cepBack4AppModel = CepBack4AppModel.criar(
                              cep,
                              viacepModel.logradouro!,
                              viacepModel.complemento!,
                              viacepModel.bairro!,
                              viacepModel.localidade!,
                              viacepModel.uf!,
                              viacepModel.ddd!);
                          await cepBack4AppRepository.criar(cepBack4AppModel);
                        }
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
          carregando
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                      itemCount: _cepsBack4App.ceps.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var dados = _cepsBack4App.ceps[index];
                        return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            await cepBack4AppRepository.remover(dados.objectId);
                            obterCeps();
                          },
                          key: Key(dados.cep),
                          child: ListTile(
                            title: Text(dados.logradouro),
                            subtitle: Text(
                              "${dados.localidade ?? ""} - ${dados.uf ?? ""}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      }),
                ),
          if (loading) const CircularProgressIndicator()
        ],
      ),
    ));
  }
}
