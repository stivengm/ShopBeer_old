import 'package:flutter/material.dart';
import 'package:shop_beer/pages/cart/cart_page.dart';
import 'package:shop_beer/pages/dashboard/dashboard_page.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'cart':       ( _ ) => const CartPage(),
  'dashboard':  ( _ ) => const DashboardPage(),
};