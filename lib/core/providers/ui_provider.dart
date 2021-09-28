import 'package:flutter/material.dart';


class UiProvider extends ChangeNotifier {
  int _cartLength = 0;

  int get cartLength {
    return _cartLength;
  }

  set cartLength( int i ) {
    _cartLength = i;
    notifyListeners();
  }
}