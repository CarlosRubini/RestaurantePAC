import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';
import 'package:projeto_pac/models/usuario/usuario_state.dart';
import 'package:projeto_pac/pages/usuario/login_usuario.dart';
import 'package:projeto_pac/pages/usuario/minha_conta.dart';
import 'package:provider/provider.dart';

class LoginUsuarioMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UsuarioState>(builder:
        (BuildContext context, UsuarioState usuarioState, Widget widget) {
      Usuario usuario = usuarioState.getUsuarioLogado();
      return Container(
        child: Row(
          children: [
            getTextUsuario(usuario),
            PopupMenuButton(
              child: Icon(
                Icons.account_box,
                size: 30,
              ),
              onSelected: (string) {
                selectOption(context, string, usuarioState);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                getLoginPopUp(usuario),
                const PopupMenuItem<String>(value: "Sair", child: Text("Sair")),
              ],
            )
          ],
        ),
      );
    });
  }

  Text getTextUsuario(Usuario usuario) {
    if (usuario == null) {
      return Text("Login");
    }

    return Text(usuario.nomeUsuario);
  }

  PopupMenuItem<String> getLoginPopUp(Usuario usuario) {
    if (usuario == null) {
      return const PopupMenuItem<String>(value: "Login", child: Text("Login"));
    }

    return const PopupMenuItem<String>(
        value: "Conta", child: Text("Minha Conta"));
  }

  selectOption(BuildContext context, String string, UsuarioState state) {
    if (string == "Conta") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MinhaConta(
                  title: 'Minha Conta',
                  usuario: state.getUsuarioLogado(),
                  usuarioState: state,
                )),
      );
    } else if (string == "Login") {
      showDialog(
        context: context,
        builder: (context) => LoginUsuario(state),
      );
    } else if (string == "Sair") {
      state.atualizaUsuarioLogado(null);
    }
  }
}
