import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String lerStringTexto(String texto) {
    print(texto);
    var line = stdin.readLineSync(encoding: utf8);
    return line ?? "";
  }

  static double lerDouble() {
    var value = lerString();
    try {
      return double.parse(value);
    } catch (e) {
      return 0;
    }
  }

  static double  lerDoubleTexto(String texto) {
  print(texto);
  return lerDouble();
  }

}
