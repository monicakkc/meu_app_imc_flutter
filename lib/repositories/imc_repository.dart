import 'package:hive/hive.dart';
import 'package:meuappimc/models/imc_model.dart';

class ImcRepository {

  static late Box _box;

  ImcRepository._criar();

  static Future<ImcRepository> carregar() async {
    if (Hive.isBoxOpen('configuracoes')) {
      _box = Hive.box('configuracoes');
    } else {
      _box = await Hive.openBox('configuracoes');
    }
    return ImcRepository._criar();
  }

 salvar(ImcModel imcModel) {
    _box.put(
      'imcModel', {
        'nome' : imcModel.nome,
        'altura': imcModel.altura,
        'peso': imcModel.peso
      }
    );
  }

  ImcModel obterDados() {
    var imc = _box.get('imcModel');
    if (imc == null) {
      return ImcModel.vazio();
    }
    return ImcModel(
      imc['nome'],
      imc['altura'],
      imc['peso'],
      );
  }

}