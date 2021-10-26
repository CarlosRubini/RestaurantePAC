import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario.dart';
import 'package:projeto_pac/pages/cadastro_cardapio.dart';

class TodosCardapio extends StatefulWidget {
  TodosCardapio({
    Key key,
  }) : super(key: key);

  @override
  _TodosCardapioState createState() => _TodosCardapioState();
}

class _TodosCardapioState extends State<TodosCardapio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text("Cardápio")],
          )),
        ),
        body: Center(
            child: Container(
          child: Align(
              alignment: Alignment.topCenter,
              child: GridView.count(
                  padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                  childAspectRatio: (150 / 50),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 6,
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
                                                    CadastroCardapio(
                                                      title: 'Cadastro Item',
                                                      usuario: new Usuario(
                                                          'Produto $index',
                                                          "25",
                                                          "cadu.rubini@gmail.com"),
                                                    )),
                                          )
                                        },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[teste(index, status)],
                                    )))));
                  }))),
        )));
  }

  Widget teste(int index, String status) {
    if (index == 0) {
      return Container(
        alignment: Alignment.center,
        child: Icon(
          Icons.add,
          size: 50,
        ),
        constraints: BoxConstraints(minWidth: 275, minHeight: 50),
      );
    }

    return ListTile(
      title: Text('Item $index'),
      subtitle: Text('''Preço: RS 0,000
                                                            Status $status'''),
    );
  }
}
