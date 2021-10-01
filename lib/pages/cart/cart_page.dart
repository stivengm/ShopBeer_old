import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'package:shop_beer/core/providers/cart_list_provider.dart';
import 'package:shop_beer/pages/cart/modal_edit.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/header_widget.dart';
import 'package:shop_beer/widgets/notification.dart';
import 'package:shop_beer/widgets/primary_button.dart';
import 'package:shop_beer/widgets/secundary_button.dart';
import 'package:shop_beer/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int total = 0;
  String numberPhone = "+573023458277";
  String _path = "https://wa.me/";

  @override
  Widget build(BuildContext context) {
    final cartListProvider = Provider.of<CartListProvider>(context);
    cartListProvider.getListDbCart();
    reCalcularTotal(cartListProvider);

    return Scaffold(
      appBar: const HeaderWidget(visibleCart: false),
      body: _body(cartListProvider),
    );
  }

  Widget _body(cartListProvider) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets20, vertical: AppStyle.edgeInsets15),
      decoration: const BoxDecoration(
        color: AppStyle.backgroundApp
      ),
      child: cartListProvider.cart.length > 0 ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextApp(text: 'Carrito de compras', size: 20.0, font: 'Rubik', fontW: FontWeight.bold,),
          const SizedBox(height: AppStyle.edgeInsets15),
          Expanded(
            child: Container(
              width: double.infinity,
              child: ListView.builder(
                itemCount: cartListProvider.cart.length,
                itemBuilder: ( _, i ) => Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        child: Image.network(cartListProvider.cart[i].imagen, fit: BoxFit.contain),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: AppStyle.edgeInsets15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextApp(text: cartListProvider.cart[i].title, size: 18.0, font: 'Rubik', fontW: FontWeight.bold, color: AppStyle.textColorHeader),
                              TextApp(text: _formato(int.parse(cartListProvider.cart[i].price)), size: 17.0, font: 'Rubik', color: AppStyle.textColorHeader),
                              TextApp(text: "Cantidad ${cartListProvider.cart[i].cantidad}", size: 15.0, font: 'Rubik', color: AppStyle.textColorHeader)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: AppStyle.appColor,
                              ),
                              onPressed: () {
                                showBarModalBottomSheet(
                                  context: context,
                                  expand: true,
                                  animationCurve: Curves.elasticOut,
                                  builder: ( _ ) => Container(
                                    height: double.infinity,
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                                    child: GestureDetector(
                                      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ModalEditItemCart(
                                              imagen: cartListProvider.cart[i].imagen,
                                              nombre: cartListProvider.cart[i].title,
                                            ),
                                          ),
                                          PrimaryButton(text: "Guardar", onPressed: () {}),
                                          const SizedBox(height: 10.0),
                                          SecundaryButton(text: "Cancelar", onPressed: () => Navigator.pop(context))
                                        ],
                                      ),
                                    ),
                                  )
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: AppStyle.dangerColor,
                              ),
                              onPressed: () {
                                final provDelete = Provider.of<CartListProvider>(context, listen: false);
                                provDelete.deleteItemsCartById(cartListProvider.cart[i].id);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(text: 'TOTAL: \$ ${_formato(total)}', font: 'Rubik', size: 20.0, fontW: FontWeight.bold),
                IconButton(
                  icon: const Icon(
                    Icons.help_outline_outlined,
                    size: 30.0,
                    color: AppStyle.blueColor,
                  ),
                  onPressed: () { },
                ),
              ],
            )
          ),
          SecundaryButton(text: 'Pagar', onPressed: () async {
            String articulos = "";
            for (var i = 0; i < cartListProvider.cart.length; i++) {
              var element = cartListProvider.cart[i];
              articulos = articulos + 'Artículo: ${element.title}\n Cantidad: ${element.cantidad}\n Precio: ${_formato(int.parse(element.price))}\n★★★★★★★★★★★';
            }
            String message = '''
            ★★★ShopBeer★★★
            ${articulos.toString()}
            TOTAL: ${_formato(total)}
            ''';
            print(message);
            await canLaunch(_path) ? await launch(_path + numberPhone.toString() + '?text=' + message) : const NotificationsWidget(message: "No se ha podido abrir WhatsApp para hacer el pedido").showNotificationError(context);
          })
        ],
      ) : _noInfo(),
    );
  }

  String _formato(int valor) {
    String valueFormat = NumberFormat.decimalPattern('en_US').format(valor);
    valueFormat = valueFormat.replaceAll(',', '.');
    return valueFormat;
  }

  reCalcularTotal(cartListProvider) {
    total = 0;
    for (var i = 0; i < cartListProvider.cart.length; i++) {
      total = total + int.parse(cartListProvider.cart[i].price);
    }
    total = total + 1000;
    return total;
  }

  Widget _noInfo() {
    return Container(
      child: Column(
        children: const [
          TextApp(text: 'No hay ningún artículo en el carrito.', size: 20.0, font: 'Rubik'),
          SizedBox(height: 10.0),
          TextApp(text: 'Agregue un artículo para poder completar la compra', font: 'Rubik', size: 20.0)
        ],
      ),
    );
  }

}