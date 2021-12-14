import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detalhar_pedido.dart';

class MeusPedidos extends StatefulWidget {
  MeusPedidos({
    Key key,
  }) : super(key: key);

  @override
  _MeusPedidosState createState() => _MeusPedidosState();
}

class _MeusPedidosState extends State<MeusPedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text("Pedidos")],
          )),
        ),
        body: Center(
            child: Container(
          color: Colors.grey[200],
          child: Align(
              alignment: Alignment.topCenter,
              child: GridView.count(
                  padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                  childAspectRatio: (150 / 50),
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 4,
                  children: List.generate(10, (index) {
                    MaterialColor color = Colors.orange;
                    String status = 'Ativo';
                    if (index % 2 == 0) {
                      color = Colors.red;
                      status = 'Inativo';
                    }
                    return Container(
                        child: Center(
                            child: Card(
                                color: color,
                                child: InkWell(
                                    splashColor: Colors.pink.withAlpha(255),
                                    onTap: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetalharPedido(
                                                      title: 'Detalhar Pedido',
                                                      usuario: null,
                                                    )),
                                          )
                                        },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        cardItem(index, status)
                                      ],
                                    )))));
                  }))),
        )));
  }

  Widget cardItem(int index, String status) {
    return ListTile(
      title: Text('Pedido $index'),
      subtitle: Text('''Hora: 19:45 $index
Valor Total: RS 0,000
Endereço: Rua Joao, 1
Qtde Itens: 10'''),
    );
  }
}
