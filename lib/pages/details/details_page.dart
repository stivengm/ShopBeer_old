import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class DetailsItemPage extends StatefulWidget {
  const DetailsItemPage({ Key? key }) : super(key: key);

  @override
  _DetailsItemPageState createState() => _DetailsItemPageState();
}

class _DetailsItemPageState extends State<DetailsItemPage> {

  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) print(arguments['name']);

    return Scaffold(
      appBar: AppBar(),
      body: _body(arguments),
    );
  }

  Widget _body(arguments) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppStyle.backgroundApp
      ),
      child: Column(
        children: [
          Hero(
            tag: arguments['id'],
            child: Image.network(arguments['img']),
          ),
          TextApp(text: arguments['name'], size: 20.0, font: 'Rubik', fontW: FontWeight.bold),
          TextApp(text: arguments['description'], size: 20.0, font: 'Rubik', fontW: FontWeight.bold),
        ],
      ),
    );
  }

}