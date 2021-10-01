import 'package:flutter/material.dart';
import 'package:shop_beer/styles/app_style.dart';
import 'package:shop_beer/widgets/text_widget.dart';

class ModalEditItemCart extends StatelessWidget {
  final String imagen;
  final String nombre;
  const ModalEditItemCart({ Key? key, required this.imagen, required this.nombre }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    int total = 0;
    return Container(
      color: AppStyle.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0)
                ),
                child: Image.network(imagen),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: TextApp(text: nombre, size: 20.0, font: 'Rubik', fontW: FontWeight.bold, color: AppStyle.textColorHeader),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          TextField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            onChanged: (value) {
              total = 0;
              
            },
            decoration: InputDecoration(
              labelText: "Cantidad",
              errorText: "",
              hintText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
        ],
      ),
    );
  }
}