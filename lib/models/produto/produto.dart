import 'package:json_annotation/json_annotation.dart';

part 'produto.g.dart';

@JsonSerializable()
class Produto {
  bool existe;
  int codProduto;
  String nomeProduto;
  double precoProduto;
  String imagemProduto;
  String situacaoProduto;
  String descricaoProduto;

  Produto(this.existe, this.codProduto, this.nomeProduto, this.precoProduto,
      this.imagemProduto, this.situacaoProduto, this.descricaoProduto);

  factory Produto.fromJson(Map<String, dynamic> json) =>
      _$ProdutoFromJson(json);
  Map<String, dynamic> toJson() => _$ProdutoToJson(this);
}
