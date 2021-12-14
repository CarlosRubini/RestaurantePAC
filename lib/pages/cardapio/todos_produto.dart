import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pac/models/produto/produto.dart';
import 'package:projeto_pac/repositories/produto/produto.dart';
import 'package:projeto_pac/widgets/widgets_telas/grade_produtos.dart';
import 'package:projeto_pac/widgets/wigdets_compartilhados/circular_loading.dart';

class TodosProdutos extends StatefulWidget {
  TodosProdutos({
    Key key,
  }) : super(key: key);

  @override
  _TodosProdutosState createState() => _TodosProdutosState();
}

class _TodosProdutosState extends State<TodosProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text("Administração de Produtos")],
          )),
        ),
        body: GradeTodosProdutos());
  }
}

class GradeTodosProdutos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProdutoRepository().getProdutos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Produto> produtos = [null];
            produtos.addAll(snapshot.data);
            return GradeProdutos(
              produtos: produtos,
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
