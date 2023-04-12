
import '../model/cep_back4app_model.dart';
import 'back4app_custon_dio.dart';

class TarefasBack4AppRepositoy {
  final _custonDio = Back4AppCustonDio();

  TarefasBack4AppRepositoy();

  
  Future<CepBack4AppModel> obterCep(String cep) async {
    var url = "/Cep";
    if(cep.isNotEmpty) {
      url = "$url?where={\"cep\":$cep}";
    }

    var result = await _custonDio.dio.get(url);
    return CepBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(CepBack4AppModel cepBack4AppModel) async {
    try {
      await _custonDio.dio
          .post("/Cep", data: cepBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizar(CepBack4AppModel cepBack4AppModel) async {
    try {
      var response = await _custonDio.dio.put(
          "/Cep/${cepBack4AppModel.objectId}",
          data: cepBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      var response = await _custonDio.dio.delete(
        "/Cep/$objectId",
      );
    } catch (e) {
      rethrow;
    }
  }
}