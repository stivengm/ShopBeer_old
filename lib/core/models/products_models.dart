import 'dart:convert';

class ProductsModel {
    ProductsModel({
        this.description,
        required this.img,
        required this.name,
        required this.typeProductId,
        this.id
    });

    String? description;
    String img;
    String name;
    int typeProductId;
    String? id;

    factory ProductsModel.fromJson(String str) => ProductsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductsModel.fromMap(Map<String, dynamic> json) => ProductsModel(
        description: json["description"],
        img: json["img"],
        name: json["name"],
        typeProductId: json["typeProductId"],
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "img": img,
        "name": name,
        "typeProductId": typeProductId,
    };
}
