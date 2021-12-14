import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      title: Container(
          child: Row(
        children: [
          new Image.asset(
            'assets/burger-logo.png',
            width: 75,
          ),
          Text("Restaurante"),
          Spacer(),
          Text("Usuário"),
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.account_box),
            onPressed: () => {},
          )
        ],
      )),
    );
  }
}
