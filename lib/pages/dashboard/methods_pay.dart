import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class MethodsPay extends StatelessWidget {
  const MethodsPay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets20, vertical: AppStyle.edgeInsets15),
      width: double.infinity,
      child: Column(
        children: [
          const TextApp(text: 'Nuestros métodos de pago', size: AppStyle.f18, font: 'Rubik'),
          const SizedBox(height: AppStyle.edgeInsets10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                Text("Hlo")
              ],
            ),
          ),
        ],
      )
    );
  }

  // Widget

}