import 'package:flutter/material.dart';
import 'package:shop_beer/core/path/app_path.dart';
import 'package:provider/provider.dart';
import 'package:shop_beer/core/services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MethodsPayServices() )
      ],
      child: const MyApp(),
    );
  }
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
