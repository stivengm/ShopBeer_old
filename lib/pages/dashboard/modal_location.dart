import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class ModalLocation extends StatelessWidget {
  const ModalLocation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyle.whiteColor,
      child: Column(
        children: [
          const TextApp(text: "Recuerda que la dirección que coloques aquí es donde se enviará el pedido.", size: 15.0, font: 'Rubik'),
          const SizedBox(height: 15.0),
          TextField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Torre",
              errorText: "",
              hintText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          TextField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Apartamento",
              errorText: "",
              hintText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          )
        ],
      ),
    );
  }
}