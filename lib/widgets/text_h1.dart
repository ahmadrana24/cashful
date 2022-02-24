import 'package:flutter/material.dart';

class TextH1 extends StatelessWidget {
  final String title;
  Color? color;

  TextH1({required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontSize: 36,
            color: color ?? Colors.white,
            fontWeight: FontWeight.bold));
  }
}
