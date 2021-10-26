import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario.dart';
import 'package:projeto_pac/widgets/menu_lateral.dart';

import 'minha_conta.dart';

class PaginaInicial extends StatefulWidget {
  PaginaInicial({Key key}) : super(key: key);

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          toolbarHeight: 75,
          title: Container(
              child: Row(
            children: [
              new Image.asset(
                'assets/burger-logo.png',
                width: 75,
              ),
              Text("Hamburgueria"),
              Spacer(),
              Text("Usuário"),
              PopupMenuButton(
                child: Icon(
                  Icons.account_box,
                  size: 30,
                ),
                onSelected: (string) {
                  selectOption(string);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                      value: "Conta", child: Text("Minha Conta")),
                  const PopupMenuItem<String>(
                      value: "Sair", child: Text("Sair")),
                ],
              )
            ],
          )),
        ),
        drawer: MenuLateral(),
        body: Center(
            child: Container(
          child: Align(
              alignment: Alignment.topCenter,
              child: GridView.count(
                  padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 6,
                  children: List.generate(10, (index) {
                    return Container(
                        child: Center(
                            child: Card(
                                color: Colors.orange,
                                child: InkWell(
                                    splashColor: Colors.pink.withAlpha(255),
                                    onTap: () => {},
                                    child: Column(
                                      children: <Widget>[
                                        new Image.asset(
                                          'assets/burger-logo.png',
                                          width: 200,
                                        ),
                                        ListTile(
                                          title: Text('Item $index'),
                                          subtitle: Text('SubTitle Item'),
                                        )
                                      ],
                                    )))));
                  }))),
        )));
  }

  selectOption(string) {
    if (string == "Conta") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MinhaConta(
                  title: 'Minha Conta',
                  usuario:
                      new Usuario("Teste", "Senha123", "cadu.rubini@gmail.com"),
                )),
      );
    }
  }
}
