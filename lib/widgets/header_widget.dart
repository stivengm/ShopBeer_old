import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';


class HeaderWidget extends StatelessWidget with PreferredSizeWidget{
  final bool visibleCart;
  final int? cartItems;
  const HeaderWidget({ Key? key, this.visibleCart = false, this.cartItems }) : super(key: key);

  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppStyle.appColor,
      title: const TextApp(text: 'ShopBeer', font: 'Curved', size: 34.0, fontW: FontWeight.bold ),
      actions: <Widget> [
        visibleCart ? Container(
          margin: const EdgeInsets.only(right: AppStyle.edgeInsets15, top: AppStyle.edgeInsets5),
          child: Badge(
            badgeContent: TextApp(text: cartItems.toString(), size: 15.0, font: 'Rubik', color: AppStyle.whiteColor,),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 35.0,
              ),
              onPressed: () => Navigator.pushNamed(context, 'cart'),
            ),
          ),
        ) : Container(),
      ],
    );
  }
}