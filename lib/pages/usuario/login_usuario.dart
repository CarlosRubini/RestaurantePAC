import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';
import 'package:projeto_pac/models/usuario/usuario_state.dart';
import 'package:projeto_pac/repositories/usuario/usuario.dart';

import 'minha_conta.dart';

// ignore: must_be_immutable
class LoginUsuario extends StatelessWidget {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UsuarioState usuarioState = UsuarioState();

  LoginUsuario(UsuarioState state) {
    usuarioState = state;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // Vertically center the widget inside the column
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 380,
            width: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Form(
              key: _formKey,
              child: Card(
                margin: EdgeInsets.all(0),
                child: ListView(
                  children: [
                    Container(
                      height: 125,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      decoration: BoxDecoration(color: Colors.orange),
                      child: new Image.asset(
                        'assets/burger-logo.png',
                        width: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: TextFormField(
                        controller: _userController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: (String value) {
                          return (value == null || value.isEmpty)
                              ? 'Campo obrigatório'
                              : null;
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.security),
                            border: OutlineInputBorder(),
                            labelText: 'Senha',
                          ),
                          validator: (String value) {
                            return (value == null || value.isEmpty)
                                ? 'Campo obrigatório'
                                : null;
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              minimumSize: new Size(100, 50)),
                          child: Text("Entrar"),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _loginUsuario(context, usuarioState);
                            }
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              minimumSize: new Size(100, 50)),
                          child: Text("Criar Conta"),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MinhaConta(
                                        title: 'Novo Usuário',
                                        usuario: null,
                                        usuarioState: this.usuarioState,
                                      )),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _loginUsuario(
      BuildContext context, UsuarioState usuarioState) async {
    Usuario usuario = await UsuarioRepository()
        .loginUsuario(context, _userController.text, _passwordController.text);
    if (usuario != null) {
      usuarioState.atualizaUsuarioLogado(usuario);
      Navigator.of(context).pop();
    }
  }
}
