import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/http_client/http_client.dart';
import 'package:projeto_pac/models/usuario/usuario.dart';

class UsuarioRepository {
  static String _routeUrl = 'api/usuario';

  Future<Usuario> getUsuario(BuildContext context, Usuario usuario) async {
    if (usuario == null) throw ArgumentError.notNull("usuario");

    final String completeRouteUrl = '$_routeUrl/getUsuario';
    final Map<String, String> parameters = {
      'codUsuario': usuario.codUsuario.toString()
    };

    final response = await HttpClient.get(
      parameters: parameters,
      route: completeRouteUrl,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    return Usuario.fromJson(decodedJson);
  }

  Future<List<Usuario>> getUsuarios() async {
    final String completeRouteUrl = '$_routeUrl/getUsuarios';
    final response = await HttpClient.get(route: completeRouteUrl);

    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson
        .map((dynamic json) => Usuario.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Usuario> loginUsuario(
      BuildContext context, String user, String password) async {
    final String completeRouteUrl = '$_routeUrl/loginUsuario';
    final Map<String, String> loginData = authToJson(user, password);

    final response =
        await HttpClient.get(route: completeRouteUrl, parameters: loginData);

    final Usuario usuario = Usuario.fromJson(jsonDecode(response.body));
    return usuario;
  }

  Map<String, String> authToJson(String user, String password) {
    return {'email': user, 'password': password};
  }
}
