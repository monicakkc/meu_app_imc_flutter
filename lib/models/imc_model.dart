class ImcModel{
  String _nome = "";
  double _altura = 0;
  double _peso = 0;

  ImcModel.vazio() {
    _nome = "";
    _altura = 0;
    _peso = 0;
  }

  ImcModel(
    this._nome, this._altura, 
    this._peso);

  String get nome => _nome;
  set nome(String nome) {
    _nome = nome;
  }

 double get altura => _altura;
  set altura(double altura) {
    _altura = altura;
  } 

 double get peso => _peso;
  set peso(double peso) {
    _peso = peso;
  } 


}