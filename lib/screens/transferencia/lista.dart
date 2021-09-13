import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget {
  //List <Transferencia> fica nessa classe pois é algo que não vai mudar o valor, a lista continuará "estática"
  //e para acessar o _listaTransferencia em outra classe, devemos usar o widget. antes
  //exemplo: widget._listaTransferencia.add(Transferencia(240, 23995))

  final List<Transferencia> _listaTransferencia = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._listaTransferencia.length,
        itemBuilder: (context, indice) {
          final transferencias = widget._listaTransferencia[indice];
          return ItemTransferencia(transferencias);
        }, // itemBuilder
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        }, // onPressed
      ),
    );
  }

  void _atualiza(transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._listaTransferencia.add(transferenciaRecebida);
      });
    }
  }
}

//cards de transferencias
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}