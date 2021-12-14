import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/http_client/http_client.dart';
import 'package:projeto_pac/models/produto/produto.dart';

class ProdutoCriacaoRepository {
  static String _routeUrl = 'api/produto/criacao';

  Future<Produto> criarProduto(BuildContext context, Produto produto) async {
    final Map<String, dynamic> mapProduto = produto.toJson();
    final String jsonProduto = jsonEncode(mapProduto);

    final String route = _routeUrl;
    final response = await HttpClient.postJson(
      route: route,
      jsonBody: jsonProduto,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    final Produto produtoRetorno = Produto.fromJson(decodedJson);
    return produtoRetorno;
  }
}
