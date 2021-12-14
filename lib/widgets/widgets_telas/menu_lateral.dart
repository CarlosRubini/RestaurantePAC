import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';
import 'package:projeto_pac/models/usuario/usuario_state.dart';
import 'package:projeto_pac/pages/cardapio/todos_produto.dart';
import 'package:projeto_pac/pages/pedido/meus_pedidos.dart';
import 'package:projeto_pac/pages/pedido/todos_pedidos.dart';
import 'package:projeto_pac/pages/usuario/todos_usuarios.dart';
import 'package:provider/provider.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UsuarioState>(builder:
        (BuildContext context, UsuarioState usuarioState, Widget widget) {
      Usuario usuario = usuarioState.getUsuarioLogado();
      if (usuario != null && usuario.tipoUsuario == "Administrador") {
        return _administrador(context, usuarioState);
      } else {
        return _usuario(context);
      }
    });
  }
}

Widget _usuario(BuildContext context) {
  return Container(
      child: Drawer(
          child: ListView(
    padding: EdgeInsets.all(10),
    children: <Widget>[
      Container(
          height: 60.0,
          child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ))),
      Container(
          height: double.maxFinite,
          child: ListView(
            children: [
              Container(
                  child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeusPedidos()),
                  )
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.backpack,
                      size: 40,
                    ),
                    Text(
                      "Meus Pedidos",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
            ],
          ))
    ],
  )));
}

Widget _administrador(BuildContext context, UsuarioState state) {
  return Container(
      child: Drawer(
          child: ListView(
    padding: EdgeInsets.all(10),
    children: <Widget>[
      Container(
          height: 60.0,
          child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ))),
      Container(
          height: double.maxFinite,
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Container(
                  child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodosPedidos()),
                  )
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.backpack,
                      size: 40,
                    ),
                    Text(
                      "Pedidos",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                  child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TodosUsuarios(usuarioState: state)),
                  )
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.account_box,
                      size: 40,
                    ),
                    Text(
                      "Usuários",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                  child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodosProdutos()),
                  )
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.food_bank,
                      size: 40,
                    ),
                    Text(
                      "Cardárpio",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
            ],
          ))
    ],
  )));
}
