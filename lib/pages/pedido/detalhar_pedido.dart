import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';

class DetalharPedido extends StatefulWidget {
  DetalharPedido({Key key, this.title, this.usuario}) : super(key: key);

  final Usuario usuario;
  final String title;
  @override
  _DetalharPedidoState createState() => _DetalharPedidoState();
}

class _DetalharPedidoState extends State<DetalharPedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text(this.widget.title)],
          )),
        ),
        body: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Center(
                        child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 50),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: GridView.count(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.fromLTRB(100, 15, 100, 15),
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              crossAxisCount: 8,
                              children: List.generate(8, (index) {
                                return Container(
                                    child: Center(
                                        child: Card(
                                            color: Colors.orange,
                                            child: InkWell(
                                                splashColor:
                                                    Colors.pink.withAlpha(255),
                                                onTap: () => {},
                                                child: Column(
                                                  children: <Widget>[
                                                    new Image.asset(
                                                      'assets/burger-logo.png',
                                                      width: 100,
                                                    ),
                                                    ListTile(
                                                      title:
                                                          Text('Item $index'),
                                                      subtitle: Text(
                                                          'Preço: RS 0,00'),
                                                    )
                                                  ],
                                                )))));
                              }))),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Center(
                        child: Container(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 50),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Endereço: Rua Teste 123",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Preço Total: RS 100,00",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Dados do Pedinte: Carlos Eduardo Rubini, cadu.rubini@gmail.com, 47 99999-9999",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () => {},
                                  child: Text("Terminar Entrega"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.deepOrange,
                                      minimumSize: new Size(100, 50)),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                ElevatedButton(
                                  onPressed: () => {},
                                  child: Text("Saiu para Entrega"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      minimumSize: new Size(100, 50)),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                ElevatedButton(
                                  onPressed: () => {},
                                  child: Text("Cancelar Pedido"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      minimumSize: new Size(100, 50)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                )
              ],
            )));
  }
}
