import 'package:flutter/material.dart';
import 'package:shop_beer/core/path/app_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopBeer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: true,
      initialRoute: 'dashboard',
      routes: routesApp(),
    );
  }
}
