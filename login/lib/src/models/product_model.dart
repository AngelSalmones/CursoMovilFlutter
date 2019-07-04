// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String title;
  double value;
  bool avalible;
  String photourl;

  ProductModel({
    this.id,
    this.title = '',
    this.value= 0.0,
    this.avalible= true,
    this.photourl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => new ProductModel(
    id: json["id"],
    title: json["title"],
    value: json["value"],
    avalible: json["avalible"],
    photourl: json["photourl"],
  );

  Map<String, dynamic> toJson() => {
   // "id": id,
    "title": title,
    "value": value,
    "avalible": avalible,
    "photourl": photourl,
  };
}
