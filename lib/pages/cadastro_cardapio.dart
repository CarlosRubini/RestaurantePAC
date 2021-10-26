// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_pac/models/usuario.dart';

class CadastroCardapio extends StatefulWidget {
  CadastroCardapio({Key key, this.title, this.usuario}) : super(key: key);

  final Usuario usuario;
  final String title;

  @override
  _CadastroCardapioState createState() => _CadastroCardapioState();
}

class _CadastroCardapioState extends State<CadastroCardapio> {
  Uint8List uploadedImage;
  String _selectedStatus = 'Ativo';

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    nameController.text = this.widget.usuario.nome;
    final priceController = TextEditingController();
    priceController.text = this.widget.usuario.senha;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
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
                    controller: nameController,
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
                    controller: priceController,
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
                  DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('Status'), // Not necessary for Option 1
                    value: _selectedStatus,
                    items: <String>['', 'Ativo', 'Inativo'].map((String value) {
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
                      setState(() {});
                      if (_formKey.currentState.validate()) {}
                    },
                  )),
                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    child: uploadedImage != null
                        ? Image.memory(uploadedImage)
                        : Text('loading...'),
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
}
