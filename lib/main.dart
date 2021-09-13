import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreen[600],
        accentColor: Colors.green[900],
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
        ),
        iconTheme: IconThemeData(
          size:
              35.0, //alterando o tamanho do "+" do botão para realizar transferência
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}
