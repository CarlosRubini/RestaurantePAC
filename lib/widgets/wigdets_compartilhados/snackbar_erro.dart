import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar snackBarErro(String erro) {
  return SnackBar(
    duration: Duration(seconds: 5),
    content: Text(
      erro,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.green,
  );
}
