
import 'package:meuappimc/functions/mostrar_imc.dart';
import 'package:meuappimc/models/meu_app_imc.dart';

funcCalculaIMC(peso, altura) {

  if (altura != 0 && peso != 0) {
    double imc = calcularIMC(altura, peso);
    return imc;
  } else {
    return 0;
  }

}
