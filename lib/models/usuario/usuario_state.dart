import 'package:flutter/cupertino.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';

class UsuarioState extends ChangeNotifier {
  Usuario _usuario;

  Usuario getUsuarioLogado() {
    return _usuario;
  }

  void atualizaUsuarioLogado(Usuario usuario) {
    this._usuario = usuario;
    notifyListeners();
  }
}
