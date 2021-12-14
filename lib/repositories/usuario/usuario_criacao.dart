import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/http_client/http_client.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';

class UsuarioCriacaoRepository {
  static String _routeUrl = 'api/usuario/criacao';

  Future<Usuario> criarUsuario(BuildContext context, Usuario usuario) async {
    final Map<String, dynamic> mapUsuario = usuario.toJson();
    final String jsonUsuario = jsonEncode(mapUsuario);

    final String route = _routeUrl;
    final response = await HttpClient.postJson(
      route: route,
      jsonBody: jsonUsuario,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    final Usuario usuarioRetorno = Usuario.fromJson(decodedJson);
    return usuarioRetorno;
  }
}
