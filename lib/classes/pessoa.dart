
class Pessoa {
  String _nome = "";
  String _sexo = "";
  double _altura = 0;
  double _peso = 0;
 

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome(){
    return _nome;
  }

void setSexo(String sexo) {
    _sexo = sexo;
  }

  String getSexo(){
    return _sexo;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

void setPeso(double peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }


  Pessoa(String nome, String sexo, double altura, double peso ) {
    _nome = nome;
    _sexo = sexo;
    _altura = altura;
    _peso = peso;
  }

  @override
  String toString() {
    return {"Nome ": _nome, "Sexo ": _sexo, "Altura ": _altura, "Peso": _peso}.toString();
  }

}