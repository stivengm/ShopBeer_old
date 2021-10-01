import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DescuentosServices extends ChangeNotifier {

  final String _baseUrl = "shop-beer-default-rtdb.firebaseio.com";
  final int discount = 0;
  final String description = "";
  final String vencimiento = "";
  bool isLoading = true;

  DescuentosServices() {
    loadDescuentos();
  }

  Future loadDescuentos() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'descuentos.json');
    final resp = await http.get( url );
    
  }

}