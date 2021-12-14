import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';
import 'package:projeto_pac/models/usuario/usuario_state.dart';
import 'package:projeto_pac/pages/usuario/minha_conta.dart';

class GradeUsuarios extends StatelessWidget {
  GradeUsuarios({this.usuarios, this.usuarioState});

  final List<Usuario> usuarios;
  final UsuarioState usuarioState;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.grey[200],
      child: Align(
          alignment: Alignment.topCenter,
          child: GridView.count(
              padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
              childAspectRatio: (150 / 50),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 6,
              children: List.generate(this.usuarios.length, (index) {
                return Container(
                    child: Center(
                        child: Card(
                            color: getColorUsuario(this.usuarios[index]),
                            child: InkWell(
                                splashColor: Colors.pink.withAlpha(255),
                                onTap: () async => {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MinhaConta(
                                                  title:
                                                      'Administração de Usuário',
                                                  usuario: this.usuarios[index],
                                                  usuarioState:
                                                      this.usuarioState,
                                                )),
                                      ),
                                      Navigator.of(context).pop()
                                    },
                                child: CardUsuario(this.usuarios[index])))));
              }))),
    ));
  }

  Color getColorUsuario(Usuario usuario) {
    if (usuario != null && usuario.tipoUsuario == 'Usuário') {
      return Colors.amber;
    } else {
      return Colors.orange;
    }
  }
}

class CardUsuario extends StatelessWidget {
  CardUsuario(this.usuario);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return cardUsuario(usuario);
  }
}

Widget cardUsuario(Usuario usuario) {
  if (usuario == null) {
    return Container(
      height: 60,
      width: 250,
      alignment: Alignment.center,
      child: Icon(
        Icons.add,
        size: 40,
      ),
    );
  }

  return ListTile(
    title: Text(usuario.nomeUsuario.toString()),
    subtitle: Text('''${usuario.tipoUsuario}
Email: ${usuario.emailUsuario}'''),
  );
}
