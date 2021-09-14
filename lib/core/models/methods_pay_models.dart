// To parse this JSON data, do
//
//     final methodsPayModel = methodsPayModelFromMap(jsonString);

import 'dart:convert';

class MethodsPayModel {
    MethodsPayModel({
        this.description,
        required this.img,
        required this.name,
        required this.typeMethodId,
        this.zona,
        this.id,
    });

    String? description;
    String img;
    String name;
    int typeMethodId;
    String? zona;
    String? id;

    factory MethodsPayModel.fromJson(String str) => MethodsPayModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MethodsPayModel.fromMap(Map<String, dynamic> json) => MethodsPayModel(
        description: json["description"],
        img: json["img"],
        name: json["name"],
        typeMethodId: json["typeMethodId"],
        zona: json["zona"],
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "img": img,
        "name": name,
        "typeMethodId": typeMethodId,
        "zona": zona,
    };

    MethodsPayModel copy() => MethodsPayModel(
      description: this.description,
      img: this.img,
      name: this.name,
      typeMethodId: this.typeMethodId,
      zona: this.zona,
      id: this.id,
    );
}
