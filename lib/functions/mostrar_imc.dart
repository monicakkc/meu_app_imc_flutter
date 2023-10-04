String mostrarIMC(imc) {

  if(imc < 18.5) {
      return 'Abaixo do peso!';
  } else if(imc < 25 && imc >=18.5) {
      return 'Peso Normal.';
  } else if(imc < 30 && imc >=25) {
      return 'Acima do Peso!';
  } else if(imc < 40 && imc >=30) {
      return 'Obeso!';
  } else {
      return 'Obesidade mórbida!';
  }

}
