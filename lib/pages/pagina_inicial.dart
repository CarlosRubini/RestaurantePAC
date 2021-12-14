import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario/usuario_state.dart';
import 'package:projeto_pac/widgets/widgets_telas/login_usuario.dart';
import 'package:projeto_pac/widgets/widgets_telas/menu_lateral.dart';
import 'package:provider/provider.dart';

import 'usuario/minha_conta.dart';

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

  UsuarioState usuarioState;

  _PaginaInicialState() {
    usuarioState = UsuarioState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => usuarioState)],
        child: Scaffold(
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
                  LoginUsuarioMenu()
                ],
              )),
            ),
            drawer: MenuLateral(),
            body: Center(
                child: Container(
              color: Colors.grey[200],
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
            ))));
  }

  selectOption(string) {
    if (string == "Conta") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MinhaConta(
                title: 'Minha Conta',
                usuario: null,
                usuarioState: this.usuarioState)),
      );
    }
  }
}
