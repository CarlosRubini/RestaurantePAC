import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:projeto_pac/models/http_client/http_client.dart';
import 'package:projeto_pac/models/produto/produto.dart';

class ProdutoRepository {
  static String _routeUrl = 'api/produto';

  Future<Produto> getUsuario(BuildContext context, Produto produto) async {
    if (produto == null) throw ArgumentError.notNull("produto");

    final String completeRouteUrl = '$_routeUrl/getProduto';
    final Map<String, String> parameters = {
      'codProduto': produto.codProduto.toString()
    };

    final response = await HttpClient.get(
      parameters: parameters,
      route: completeRouteUrl,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    return Produto.fromJson(decodedJson);
  }

  Future<List<Produto>> getProdutos() async {
    final String completeRouteUrl = '$_routeUrl/getProdutos';
    final response = await HttpClient.get(route: completeRouteUrl);

    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson
        .map((dynamic json) => Produto.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
