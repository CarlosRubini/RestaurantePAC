import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => {},
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
                      )
                    ],
                  ),
                )),
              ],
            ))
      ],
    )));
  }
}