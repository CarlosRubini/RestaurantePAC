import 'package:flutter/material.dart';

class MinhaConta extends StatelessWidget {
  MinhaConta({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text("Minha Conta")],
          )),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          width: 300,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'Usuário',
                ),
                validator: (String value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.security),
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.security),
                  border: OutlineInputBorder(),
                  labelText: 'Confirmar Senha',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen, minimumSize: new Size(100, 50)),
                child: Text("Salvar"),
                onPressed: () => {},
              ))
            ],
          ),
        ));
  }
}
