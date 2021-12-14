import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/produto/produto.dart';
import 'package:projeto_pac/pages/cardapio/cadastro_produto.dart';

class GradeProdutos extends StatelessWidget {
  GradeProdutos({this.produtos});

  final List<Produto> produtos;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.grey[200],
      child: Align(
          alignment: Alignment.topCenter,
          child: GridView.count(
              padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 5,
              children: List.generate(this.produtos.length, (index) {
                return Container(
                    child: Center(
                        child: Card(
                            color: getColorProduto(this.produtos[index]),
                            child: InkWell(
                                splashColor: Colors.pink.withAlpha(255),
                                onTap: () async => {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CadastroProduto(
                                                  title: 'Cadastro de Produto',
                                                  produto: this.produtos[index],
                                                )),
                                      ),
                                      Navigator.of(context).pop()
                                    },
                                child: CardProduto(this.produtos[index])))));
              }))),
    ));
  }

  Color getColorProduto(Produto produto) {
    if (produto != null && produto.situacaoProduto == 'Ativo') {
      return Colors.amber;
    } else {
      return Colors.orange;
    }
  }
}

class CardProduto extends StatelessWidget {
  CardProduto(this.produto);

  final Produto produto;

  @override
  Widget build(BuildContext context) {
    return cardItem(produto);
  }
}

Widget cardItem(Produto produto) {
  if (produto == null) {
    return Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.add,
        size: 50,
      ),
      constraints: BoxConstraints(minWidth: 275, minHeight: 70),
    );
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
          constraints: BoxConstraints(maxHeight: 200),
          child: Image.memory(Base64Decoder().convert(produto.imagemProduto))),
      Divider(),
      ListTile(
        title: Text(
          '${produto.nomeProduto}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '''Preço: RS${produto.precoProduto}
Descrição: ${produto.descricaoProduto}
Status ${produto.situacaoProduto}''',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
