import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class SecundaryButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPressed;
  const SecundaryButton({ Key? key, required this.text, required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        child: TextApp(text: text, font: 'Rubik', size: 20.0, fontW: FontWeight.bold),
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(AppStyle.edgeInsets12)),
          foregroundColor: MaterialStateProperty.all<Color>(AppStyle.appColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppStyle.edgeInsets18),
              side: const BorderSide(color: AppStyle.appColor)
            )
          )
        ),
        onPressed: onPressed,
      ),
    );
  }
}