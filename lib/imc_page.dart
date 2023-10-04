import 'package:flutter/material.dart';
import 'package:meuappimc/functions/func_calcula_imc.dart';
import 'package:meuappimc/functions/mostrar_imc.dart';
import 'package:meuappimc/models/imc_model.dart';
import 'package:meuappimc/repositories/imc_repository.dart';

class ImcPage extends StatefulWidget {
  
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  var imcModel = ImcModel.vazio();
  // variáveis usadas nessa tela
  TextEditingController nomeController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  //Área principal
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center ,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                 // Logo do App 
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 5,
                        child: Image.asset(
                          "lib/images/balanca.png",
                          height: 125,
                          ),
                      ),
                     Expanded(child: Container()),                    
                    ],
                  ),

                  // Espaços  
                  const SizedBox(
                    height:20,
                  ),

                  // Texto de boas vindas
                  const Text("Calcule seu IMC",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26, fontWeight: FontWeight.w700
                      ),
                  ),
                  const Text("Digite seu nome, peso e altura",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                      ),
                  ),
                  const SizedBox(
                    height:50,
                  ),  

                  //Campo para digitar o nome
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child:  TextField(
                      controller: nomeController,
                      onChanged: (value) {
                         debugPrint(value);              
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: -5),                    
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color.fromARGB(255, 179, 77, 198))),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 179, 77, 198)),             
                        ),
                        hintText: "Nome",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.person,
                        color: Color.fromARGB(255, 179, 77, 198))),
                        ),
                  ),
                  const SizedBox(height:30),

            // campo para digita o peso
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child:  TextField(
                      keyboardType: TextInputType.number,
                      controller: pesoController,
                      onChanged: (value) {
                         debugPrint(value);              
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: -5),                    
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color.fromARGB(255, 179, 77, 198))),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 179, 77, 198)),             
                        ),
                        hintText: "Peso",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.fitness_center,
                        color: Color.fromARGB(255, 179, 77, 198))),
                        ),
                  ),
                  const SizedBox(height:30),

                  //Campo para digitar a altura
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: alturaController,
                        onChanged: (value) {
                        debugPrint(value);
                      },                      
                      style: const TextStyle(color: Colors.white),
                      decoration:  const InputDecoration(
                        contentPadding: EdgeInsets.only(top: -5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color.fromARGB(255, 179, 77, 198))),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 179, 77, 198)),                    
                        ),                    
                        hintText: "Altura",
                        hintStyle: TextStyle(color: Colors.white),                    
                        prefixIcon: Icon(Icons.height,
                        color:Color.fromARGB(255, 179, 77, 198)),                        
                        ),
                      ),
                  ),
                  
                   const SizedBox(
                    height:50,
                  ),  

                  //Botão Enviar
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus(); //fechar o teclado
                        try {
                          imcModel.altura =
                            double.parse(alturaController.text);                  
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                              title: const Text("Meu IMC"),
                              content: 
                                const Text("Informe uma altura válida. Use ponto para casas decimais."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ok"))
                              ],
                            );
                          });
                          return;
                        }
                        try {
                          imcModel.peso =
                            double.parse(pesoController.text);                  
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                              title: const Text("Meu IMC"),
                              content: 
                                const Text("Informe um peso válido. Use ponto para casas decimais."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ok"))
                              ],
                            );
                          });
                          return;
                        }
                        imcModel.nome = (nomeController.text);
                        imcModel.altura = double.parse(alturaController.text);
                        imcModel.peso = double.parse(pesoController.text);
                  //      ImcRepository.salvar(ImcModel);
                        double imcCalculado = funcCalculaIMC(imcModel.peso, imcModel.altura);
                        var imcFormatado = imcCalculado.toStringAsFixed(2);
                        String imcSignificado = mostrarIMC(imcCalculado);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                              title: const Text("Cálculo do IMC"),
                              content: 
                                Text("Seu IMC é $imcFormatado. Isso significa: $imcSignificado"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ok"))
                              ],
                            );
                          });
                       // Navigator.pop(context);                                                   
                      },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 179, 77, 198)),
                          ),
                        child: const Text("CALCULAR",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}