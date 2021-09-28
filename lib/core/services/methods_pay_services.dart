import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shop_beer/core/models/models.dart';
import 'package:http/http.dart' as http;


class MethodsPayServices extends ChangeNotifier {

  final String _baseUrl = 'shop-beer-default-rtdb.firebaseio.com';
  final List<MethodsPayModel> methods = [];
  bool isLoading = true;

  MethodsPayServices() {
    loadMethods();
  }

  Future<List<MethodsPayModel>> loadMethods() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'medios_pago.json' );
    final resp = await http.get( url );

    final Map<String, dynamic> productosMap = json.decode(resp.body);

    productosMap.forEach((key, value) {
      final tempProduct = MethodsPayModel.fromMap( value );
      tempProduct.id = key;
      methods.add( tempProduct );
    });

    isLoading = false;
    notifyListeners();

    return methods;

  }

}
