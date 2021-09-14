import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appColor,
        title: TextApp(text: 'ShopBeer', font: 'Curved', size: 34.0, fontW: FontWeight.bold ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: Text("Hola mundo"),
    );
  }

}