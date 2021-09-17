import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String text;
  final double size;
  final String font;
  final FontWeight? fontW;
  final Color? color;
  final TextAlign? textAlign;
  const TextApp({ Key? key, required this.text, required this.size, required this.font, this.fontW, this.color, this.textAlign }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: color, fontFamily: font, fontSize: size, fontWeight: fontW), textAlign: textAlign,);
  }
}
