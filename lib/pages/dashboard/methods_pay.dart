import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_beer/core/services/services.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class MethodsPay extends StatelessWidget {
  const MethodsPay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final methodsServices = Provider.of<MethodsPayServices>(context);

    if ( methodsServices.isLoading ) return const CircularProgressIndicator();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppStyle.edgeInsets15),
      width: double.infinity,
      child: Column(
        children: [
          const TextApp(text: 'Nuestros métodos de pago', size: AppStyle.f18, font: 'Rubik'),
          const SizedBox(height: AppStyle.edgeInsets10),
          Container(
            padding: const EdgeInsets.all(AppStyle.edgeInsets5),
            width: double.infinity,
            height: 85.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: methodsServices.methods.length,
              itemBuilder: ( BuildContext context, int index ) => Container(
                margin: const EdgeInsets.only(right: AppStyle.edgeInsets5),
                width: 100.0,
                child: Image.network(methodsServices.methods[index].img, fit: BoxFit.contain,),
              )
            ),
          ),
        ],
      )
    );
  }

}