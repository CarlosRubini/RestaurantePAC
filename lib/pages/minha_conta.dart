import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario.dart';

class MinhaConta extends StatefulWidget {
  MinhaConta({Key key, this.title, this.usuario}) : super(key: key);

  final Usuario usuario;
  final String title;
  @override
  _MinhaContaState createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    userController.text = this.widget.usuario.nome;
    final passwordController = TextEditingController();
    passwordController.text = this.widget.usuario.senha;
    final confirmpasswordController = TextEditingController();
    confirmpasswordController.text = this.widget.usuario.senha;
    final emailController = TextEditingController();
    emailController.text = this.widget.usuario.email;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text(this.widget.title)],
          )),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Usuário',
                    ),
                    validator: (String value) {
                      return (value == null || value.isEmpty)
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    validator: (String value) {
                      if (value != null &&
                          value != confirmpasswordController.text) {
                        return 'As Senhas não estão iguais!';
                      }
                      return (value == null || value.isEmpty)
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: confirmpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(),
                      labelText: 'Confirmar Senha',
                    ),
                    validator: (String value) {
                      if (value != null && value != passwordController.text) {
                        return 'As Senhas não estão iguais!';
                      }
                      return (value == null || value.isEmpty)
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (String value) {
                      return (value == null ||
                              value.isEmpty ||
                              !value.contains('@'))
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen,
                        minimumSize: new Size(100, 50)),
                    child: Text("Salvar"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (passwordController.text !=
                            confirmpasswordController.text) {}
                      }
                    },
                  ))
                ],
              ),
            )));
  }
}
