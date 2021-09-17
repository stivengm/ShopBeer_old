import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_beer/core/providers/cart_list_provider.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/header_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {

  final cartListProvider = Provider.of<CartListProvider>(context);
  cartListProvider.cart;
  
    return Scaffold(
      appBar: const HeaderWidget(visibleCart: false),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets20, vertical: AppStyle.edgeInsets15),
      decoration: const BoxDecoration(
        color: AppStyle.backgroundApp
      ),
      child: Column(
        
      ),
    );
  }

}