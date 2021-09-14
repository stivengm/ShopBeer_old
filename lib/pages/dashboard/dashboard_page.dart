import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_beer/core/services/services.dart';
import 'package:shop_beer/pages/dashboard/methods_pay.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appColor,
        title: const TextApp(text: 'ShopBeer', font: 'Curved', size: 34.0, fontW: FontWeight.bold ),
        actions: <Widget> [
          Container(
            margin: const EdgeInsets.only(right: AppStyle.edgeInsets15, top: AppStyle.edgeInsets5),
            child: Badge(
              badgeContent: const TextApp(text: "0", size: 15.0, font: 'Rubik', color: AppStyle.whiteColor,),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 35.0,
                ),
                onPressed: () => Navigator.pushNamed(context, 'cart'),
              ),
            ),
          ),
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    Size _media = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: AppStyle.backgroundApp
      ),
      width: _media.width * 1.0,
      height: _media.height * 1.0,
      child: Column(
        children: const [
          MethodsPay(),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      child: TextApp(
        text: "Cerveza",
        font: '',
      ),
    );
  }

  // Lista de todo.
  // Cerveza, Aguardiente, Ron, Wiskey, Tequila, Gaseosa, Varios, Mecato

}