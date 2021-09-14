import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String text;
  final double size;
  final String font;
  final FontWeight? fontW;
  final Color? color;
  const TextApp({ Key? key, required this.text, required this.size, required this.font, this.fontW, this.color }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: color, fontFamily: font, fontSize: size, fontWeight: fontW),);
  }
}
