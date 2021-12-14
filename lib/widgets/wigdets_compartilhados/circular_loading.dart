import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).backgroundColor,
          strokeWidth: 8,
        ),
      ),
    );
  }
}
