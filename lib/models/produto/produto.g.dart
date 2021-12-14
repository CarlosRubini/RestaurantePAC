// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Produto _$ProdutoFromJson(Map<String, dynamic> json) {
  return Produto(
    json['existe'] as bool,
    json['codProduto'] as int,
    json['nomeProduto'] as String,
    (json['precoProduto'] as num)?.toDouble(),
    json['imagemProduto'] as String,
    json['situacaoProduto'] as String,
    json['descricaoProduto'] as String,
  );
}

Map<String, dynamic> _$ProdutoToJson(Produto instance) => <String, dynamic>{
      'existe': instance.existe,
      'codProduto': instance.codProduto,
      'nomeProduto': instance.nomeProduto,
      'precoProduto': instance.precoProduto,
      'imagemProduto': instance.imagemProduto,
      'situacaoProduto': instance.situacaoProduto,
      'descricaoProduto': instance.descricaoProduto,
    };
