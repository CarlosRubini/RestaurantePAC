import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar snackBarSucesso() {
  return SnackBar(
    duration: Duration(seconds: 5),
    content: Text(
      "Sucesso",
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.green,
  );
}
