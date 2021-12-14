// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_pac/models/produto/produto.dart';
import 'package:projeto_pac/repositories/produto/produto_criacao.dart';
import 'package:projeto_pac/widgets/wigdets_compartilhados/snackbar_erro.dart';
import 'package:projeto_pac/widgets/wigdets_compartilhados/snackbar_sucesso.dart';

// ignore: must_be_immutable
class CadastroProduto extends StatefulWidget {
  CadastroProduto({Key key, this.title, this.produto}) : super(key: key);

  Produto produto;
  final String title;

  @override
  _CadastroProdutoState createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  Uint8List uploadedImage;
  String _selectedStatus = 'Ativo';
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (this.widget.produto != null) {
      _nameController.text = this.widget.produto.nomeProduto;
      _priceController.text = this.widget.produto.precoProduto.toString();
      _descriptionController.text = this.widget.produto.descricaoProduto;
      _selectedStatus = this.widget.produto.situacaoProduto;
      uploadedImage =
          Base64Decoder().convert(this.widget.produto.imagemProduto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: new AppBar(
          title: Container(
              child: Row(
            children: [Text(this.widget.title)],
          )),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.push_pin_rounded),
                      border: OutlineInputBorder(),
                      labelText: 'Nome Produto',
                    ),
                    validator: (String value) {
                      return (value == null || value.isEmpty)
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on),
                      border: OutlineInputBorder(),
                      labelText: 'Preço Unitário',
                    ),
                    validator: (String value) {
                      return (value == null || value.isEmpty)
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    maxLines: 5,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.description),
                      border: OutlineInputBorder(),
                      labelText: 'Descrição',
                    ),
                    validator: (String value) {
                      return (value == null || value.isEmpty)
                          ? 'Campo obrigatório'
                          : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('Status'), // Not necessary for Option 1
                    value: _selectedStatus,
                    items: <String>['Ativo', 'Inativo'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value;
                      });
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        _startFilePicker();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.black,
                          ),
                          Text(
                            "Imagem",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen,
                        minimumSize: new Size(100, 50)),
                    child: Text("Salvar"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        createProduct(context);
                      }
                    },
                  )),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    constraints: BoxConstraints(maxHeight: 300),
                    child: uploadedImage != null
                        ? Image.memory(uploadedImage)
                        : Text(''),
                  ),
                ],
              ),
            )));
  }

  _startFilePicker() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        FileReader reader = FileReader();

        reader.onLoadEnd.listen((e) {
          setState(() {
            uploadedImage = reader.result;
          });
        });

        reader.onError.listen((fileEvent) {
          setState(() {});
        });

        reader.readAsArrayBuffer(file);
      }
    });
  }

  void createProduct(BuildContext context) async {
    try {
      final produto = Produto(
          this.widget.produto != null,
          this.widget.produto != null ? this.widget.produto.codProduto : 1,
          _nameController.text,
          double.parse(_priceController.text),
          base64Encode(uploadedImage),
          _selectedStatus,
          _descriptionController.text);
      this.widget.produto =
          await ProdutoCriacaoRepository().criarProduto(context, produto);
      ScaffoldMessenger.of(context).showSnackBar(snackBarSucesso());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarErro(e.ToString()));
    }
  }
}
