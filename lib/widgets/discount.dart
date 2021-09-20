import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';


class DiscountWidget extends StatelessWidget {
  const DiscountWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 90.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80.0,
            color: Colors.blue,
            child: Row(
              children: [
                const TextApp(text: '20%', size: 40.0, font: 'Curved', color: AppStyle.whiteColor),
                Container(
                  // width: double.infinity,
                  child: const Text("de descuento en cervezas Póker y Águila", style: TextStyle(color: AppStyle.whiteColor,), overflow: TextOverflow.ellipsis, maxLines: 2, ),
                  // child: Center(child: TextApp(text: 'de descuento en cervezas Póker y Águila', font: 'Rubik', size: 20.0)),
                )
              ],
            )
          ),
          const TextApp(text: 'Aplica desde el 10 de sept hasta el 15 de sept', size: 13.0, font: 'Rubik', color: AppStyle.whiteColor, textAlign: TextAlign.right)
        ],
      ),
    );
  }
}