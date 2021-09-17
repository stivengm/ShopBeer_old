import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_beer/core/models/cart_models.dart';
import 'package:shop_beer/core/providers/cart_list_provider.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/header_widget.dart';
import 'package:shop_beer/widgets/notification.dart';
import 'package:shop_beer/widgets/primary_button.dart';
import 'package:shop_beer/widgets/secundary_button.dart';
import 'package:shop_beer/widgets/text_widget.dart';

import 'package:intl/intl.dart';

class DetailsItemPage extends StatefulWidget {
  const DetailsItemPage({ Key? key }) : super(key: key);

  @override
  _DetailsItemPageState createState() => _DetailsItemPageState();
}

class _DetailsItemPageState extends State<DetailsItemPage> {
  int valuePay = 0;
  int valueProduct = 0;
  int cantProd = 1;

  @override
  Widget build(BuildContext context) {

    final data = Provider.of<CartListProvider>(context);
    data.getListDbCart();
    

    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) {
      setState(() {
        valuePay = int.parse(arguments['price']);
        valueProduct = int.parse(arguments['price']);
      });
      print(arguments['name']);
    }

    Size _media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: HeaderWidget(visibleCart: true, cartItems: data.cart.length),
      body: _body(arguments, _media),
    );
  }

  String _formato(int valor) {
    String valueFormat = NumberFormat.decimalPattern('en_US').format(valor);
    valueFormat = valueFormat.replaceAll(',', '.');
    return valueFormat;
  }

  Widget _body(arguments, _media) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets20),
      decoration: const BoxDecoration(
        color: AppStyle.backgroundApp
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppStyle.edgeInsets10),
            Hero(
              tag: arguments['id'],
              child: Image.network(arguments['img'], width: _media.width * 1.0, height: _media.height * .5, fit: BoxFit.contain,),
            ),
            TextApp(text: arguments['name'], size: 30.0, font: 'Rubik', fontW: FontWeight.bold, color: AppStyle.textColorHeader),
            TextApp(text: _formato(int.parse(arguments['price'])), size: 25.0, font: 'Rubik', fontW: FontWeight.bold, color: AppStyle.blackColor),
            TextApp(text: arguments['description'], size: 20.0, font: 'Rubik', fontW: FontWeight.bold),
            _controlsCount(),
            SecundaryButton(text: 'Añadir al carrito', onPressed: () {
              final cartListProvider = Provider.of<CartListProvider>(context, listen: false);
              final register = cartListProvider.newArticleCart(arguments['name'], arguments['img'], '20000', '2');
              NotificationsWidget(title: 'Se ha añadido ${arguments["name"]} al carrito', message: '').showNotificationSuccess(context);
              // if (register > 1) {
              // } else {
              //   const NotificationsWidget(title: 'Ha ocurrido un error al añadir al carrito el artículo', message: '').showNotificationError(context);
              // }
            }),
            const SizedBox(height: AppStyle.edgeInsets10),
            PrimaryButton(text: 'Pagar', onPressed: () {})
          ],
        ),
      ),
    );
  }

  Widget _controlsCount() {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1
              )
            ),
            child: IconButton(
              icon: const Icon(
                Icons.remove
              ),
              onPressed: () {
                setState(() {
                  if (cantProd > 1) {
                    cantProd--;
                    valuePay = valueProduct * cantProd;
                  }
                });
              },
            ),
          ),
          const SizedBox(width: 10.0),
          TextApp(text: cantProd.toString(), font: 'Rubik', size: 20.0),
          const SizedBox(width: 10.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1
              )
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add
              ),
              onPressed: () {
                setState(() {
                  cantProd++;
                  valuePay = valueProduct * cantProd;
                });
              },
            ),
          ),
          cantProd > 1 ? Text(_formato(valuePay)) : Container(),
        ],
      ),
    );
  }

}