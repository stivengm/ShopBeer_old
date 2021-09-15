import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_beer/core/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsServices extends ChangeNotifier {

  final String _baseUrl = 'shop-beer-default-rtdb.firebaseio.com';
  final List<ProductsModel> productsCerveza = [];
  final List<ProductsModel> productsAguardiente = [];
  final List<ProductsModel> productsRon = [];
  final List<ProductsModel> productsWiskey = [];
  final List<ProductsModel> productsTequila = [];
  final List<ProductsModel> productsGaseosa = [];
  final List<ProductsModel> productsVarios = [];
  final List<ProductsModel> productsMecato = [];
  
  bool isLoading = true;

  ProductsServices() {
    loadProducts();
  }

  Future loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'productos.json');
    final resp = await http.get( url );

    final Map<String, dynamic> productsMap = json.decode( resp.body );

    productsMap.forEach((key, value) {
      final tempProduct = ProductsModel.fromMap( value );
      tempProduct.id = key;
      switch (tempProduct.typeProductId) {
        case 1:
          productsCerveza.add( tempProduct );
          break;
        case 2:
          productsAguardiente.add( tempProduct );
          break;
        case 3:
          productsRon.add( tempProduct );
          break;
        case 4:
          productsWiskey.add( tempProduct );
          break;
        case 5:
          productsTequila.add( tempProduct );
          break;
        case 6:
          productsGaseosa.add( tempProduct );
          break;
        case 7:
          productsVarios.add( tempProduct );
          break;
        case 8:
          productsMecato.add( tempProduct );
          break;
      }
    });

    isLoading = false;
    notifyListeners();

    return;

  }

}