import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario.dart';

import 'minha_conta.dart';

class TodosUsuarios extends StatefulWidget {
  TodosUsuarios({
    Key key,
  }) : super(key: key);

  @override
  _TodosUsuariosState createState() => _TodosUsuariosState();
}

class _TodosUsuariosState extends State<TodosUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text("Administração de Usuários")],
          )),
        ),
        body: Center(
            child: Container(
          child: Align(
              alignment: Alignment.topCenter,
              child: GridView.count(
                  padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                  childAspectRatio: (150 / 50),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 8,
                  children: List.generate(10, (index) {
                    return Container(
                        child: Center(
                            child: Card(
                                color: Colors.orange,
                                child: InkWell(
                                    splashColor: Colors.pink.withAlpha(255),
                                    onTap: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MinhaConta(
                                                      usuario: new Usuario(
                                                          'Usuário $index',
                                                          "Senha123",
                                                          "cadu.rubini@gmail.com"),
                                                    )),
                                          )
                                        },
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          title: Text('Usuário $index'),
                                          subtitle: Text(
                                              'Email: cadu.rubini@gmail.com'),
                                        )
                                      ],
                                    )))));
                  }))),
        )));
  }
}
