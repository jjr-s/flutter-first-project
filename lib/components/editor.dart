import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String exemplo;
  final String rotulo;
  final IconData icone;

  //ao usar {} no construtor, tornamos a chamada da função flexível, podendo passar diferentes variáveis na chamada do Editor() lá em cima
  Editor(
      {required this.controlador,
        required this.exemplo,
        required this.rotulo,
        required this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: Icon(icone),
          //ícone passa a variável 'ícone', que recebe o ícone lá na função Editor (cada função vai receber um tipo de ícone, por isso deve ser uma variável aqui)
          labelText: rotulo,
          //idem, ao passar variáveis aqui, podemos torná-las realmente variáveis, e não ficar limitado (para poder mandar rótulos diferentes, exemplos, etc.)
          hintText: exemplo,
        ),
        keyboardType: TextInputType.number, //tipo do teclado (somente número)
      ),
    );
  }
}