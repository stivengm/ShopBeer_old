import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        valueProduct = int.parse(arguments['price']);
        if (cantProd < 2) {
          valuePay = int.parse(arguments['price']);
        }
      });
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
              child: Image.network(arguments['img'], width: _media.width * 1.0, height: _media.height * .3, fit: BoxFit.contain,),
            ),
            TextApp(text: arguments['name'], size: 30.0, font: 'Rubik', fontW: FontWeight.bold, color: AppStyle.textColorHeader),
            TextApp(text: _formato(int.parse(arguments['price'])), size: 25.0, font: 'Rubik', fontW: FontWeight.bold, color: AppStyle.blackColor),
            const SizedBox(height: 20.0),
            TextApp(text: arguments['description'], size: 20.0, font: 'Rubik', fontW: FontWeight.bold),
            const SizedBox(height: 20.0),
            _controlsCount(),
            const SizedBox(height: 20.0),
            SecundaryButton(text: 'Añadir al carrito', onPressed: () async {
              final cartListProvider = Provider.of<CartListProvider>(context, listen: false);
              final register = cartListProvider.newArticleCart(arguments['name'], arguments['img'], valuePay.toString(), cantProd.toString());
              await NotificationsWidget(message: 'Se ha añadido ${arguments["name"]} al carrito').showNotificationSuccess(context);
              // if (register > 1) {
              // } else {
              //   const NotificationsWidget(title: 'Ha ocurrido un error al añadir al carrito el artículo', message: '').showNotificationError(context);
              // }
            }),
            const SizedBox(height: AppStyle.edgeInsets10),
            PrimaryButton(text: 'Pagar', onPressed: () {}),
            const SizedBox(height: AppStyle.edgeInsets10),
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
          Expanded(
            child: cantProd > 1 ? TextApp(text: _formato(valuePay).toString(), font: 'Rubik', size: 25.0, fontW: FontWeight.bold, textAlign: TextAlign.center) :  Container(),
          )
        ],
      ),
    );
  }

}