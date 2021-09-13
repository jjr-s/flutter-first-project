import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';
const _rotuloValor = 'Valor';
const _exemploValor = '0.00';
const _rotuloConta = 'Número da conta';
const _exemploConta = '0000';
const _textoBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorNumeroConta,
                exemplo: _exemploConta,
                rotulo: _rotuloConta,
                icone: Icons.account_circle),
            Editor(
                controlador: _controladorValor,
                exemplo: _exemploValor,
                rotulo: _rotuloValor,
                icone: Icons.monetization_on),
            ElevatedButton(
                child: Text(_textoBotao),
                onPressed: () => _criaTransferencia(
                    context) //quando temos "códigos com linha única" e necessitamos usar { }, como em uma classe, podemos substituir por =>
            ),
          ], // Widget
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final double? valor = double.tryParse(_controladorValor.text);
    final int? numeroConta = int.tryParse(_controladorNumeroConta.text);

    if (valor != null && numeroConta != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}