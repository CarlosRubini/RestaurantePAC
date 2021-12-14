import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';
import 'package:projeto_pac/models/usuario/usuario_state.dart';
import 'package:projeto_pac/repositories/usuario/usuario_criacao.dart';
import 'package:projeto_pac/widgets/wigdets_compartilhados/snackbar_erro.dart';
import 'package:projeto_pac/widgets/wigdets_compartilhados/snackbar_sucesso.dart';
import '../termos_lgpd.dart';

// ignore: must_be_immutable
class MinhaConta extends StatefulWidget {
  MinhaConta({Key key, this.title, this.usuario, this.usuarioState})
      : super(key: key);

  Usuario usuario;
  final String title;
  final UsuarioState usuarioState;

  @override
  _MinhaContaState createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedType = 'Usuário';

  @override
  void initState() {
    super.initState();
    if (this.widget.usuario != null) {
      _userController.text = this.widget.usuario.nomeUsuario;
      _passwordController.text = this.widget.usuario.senhaUsuario;
      _confirmpasswordController.text = this.widget.usuario.senhaUsuario;
      _emailController.text = this.widget.usuario.emailUsuario;
      _selectedType = this.widget.usuario.tipoUsuario;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
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
                    controller: _userController,
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
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    validator: (String value) {
                      if (value != null &&
                          value != _confirmpasswordController.text) {
                        return 'As Senhas não estão iguais!';
                      }
                      return (value == null || value.isEmpty)
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: _confirmpasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(),
                      labelText: 'Confirmar Senha',
                    ),
                    validator: (String value) {
                      if (value != null && value != _passwordController.text) {
                        return 'As Senhas não estão iguais!';
                      }
                      return (value == null || value.isEmpty)
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: _emailController,
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
                  Visibility(
                      visible: this.widget.usuario != null &&
                          this.widget.usuario.tipoUsuario == "Administrador",
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text('Status'),
                        value: _selectedType,
                        items: <String>['Usuário', 'Administrador']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedType = value;
                          });
                        },
                      )),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                      child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            minimumSize: new Size(100, 50)),
                        child: Text("Termos e Uso de Dados"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => TermosLGPD(),
                          );
                        },
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen,
                            minimumSize: new Size(100, 50)),
                        child: Text("Salvar"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            createUser(context);
                          }
                        },
                      ),
                    ],
                  ))
                ],
              ),
            )));
  }

  void createUser(BuildContext context) async {
    try {
      final usuario = Usuario(
          this.widget.usuario != null,
          this.widget.usuario != null ? this.widget.usuario.codUsuario : 1,
          _userController.text,
          _passwordController.text,
          _emailController.text,
          _selectedType);
      this.widget.usuario =
          await UsuarioCriacaoRepository().criarUsuario(context, usuario);
      ScaffoldMessenger.of(context).showSnackBar(snackBarSucesso());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarErro(e.ToString()));
    }
  }
}
