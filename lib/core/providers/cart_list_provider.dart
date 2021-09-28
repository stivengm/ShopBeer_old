import 'package:flutter/material.dart';
import 'package:shop_beer/core/models/cart_models.dart';
import 'package:shop_beer/core/providers/db_provider.dart';

class CartListProvider extends ChangeNotifier {
  List<CartModel> cart = [];
  // int id = 0;

  Future<CartModel> newArticleCart(String title, String imagen, String price, String cantidad) async {
    final newArticle = CartModel(title: title, imagen: imagen, price: price, cantidad: cantidad);
    final id = await DBProvider.db.nuevoRegistro(newArticle);
    newArticle.id = id;
    cart.add(newArticle);
    notifyListeners();
    return newArticle;
  }

  getListDbCart() async {
    final data = await DBProvider.db.getAllItemsCart();
    cart = [...data];
    notifyListeners();
    return cart;
  }

  cargarScans() async {
    final dataTemp = await DBProvider.db.getAllItemsCart();
    cart = [...dataTemp];
    notifyListeners();
  }

  deleteListDbCart() async {
    await DBProvider.db.deleteAllItemdsCart();
    cart = [];
    notifyListeners();
  }

  deleteItemsCartById( int id ) async {
    await DBProvider.db.deleteItemsCart(id);
    getListDbCart();
  }

}