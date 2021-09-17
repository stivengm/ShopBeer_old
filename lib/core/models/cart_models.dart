import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.id,
    required this.title,
    required this.imagen,
    required this.price,
    required this.cantidad
  });

  int? id;
  String title;
  String imagen;
  String price;
  String cantidad;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    title: json["title"],
    imagen: json["imagen"],
    price: json["price"],
    cantidad: json["cantidad"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "imagen": imagen,
    "price": price,
    "cantidad": cantidad,
  };
}