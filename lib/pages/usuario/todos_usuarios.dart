import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';
import 'package:projeto_pac/models/usuario/usuario_state.dart';
import 'package:projeto_pac/repositories/usuario/usuario.dart';
import 'package:projeto_pac/widgets/widgets_telas/grade_usuarios.dart';
import 'package:projeto_pac/widgets/wigdets_compartilhados/circular_loading.dart';

class TodosUsuarios extends StatefulWidget {
  TodosUsuarios({Key key, this.usuarioState}) : super(key: key);

  final UsuarioState usuarioState;

  @override
  _TodosUsuariosState createState() => _TodosUsuariosState();
}

class _TodosUsuariosState extends State<TodosUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text("Administração de Usuários")],
          )),
        ),
        body: GradeTodosUsuarios());
  }
}

class GradeTodosUsuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UsuarioRepository().getUsuarios(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Usuario> usuarios = [null];
            usuarios.addAll(snapshot.data);
            return GradeUsuarios(
              usuarios: usuarios,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          } else {
            return CircularLoading();
          }
        });
  }
}
