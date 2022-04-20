// To parse this JSON data, do
//
//     final shopModel = shopModelFromJson(jsonString);

import 'dart:convert';

List<ShopModel> shopModelFromJson(String str) =>
    List<ShopModel>.from(json.decode(str).map((x) => ShopModel.fromJson(x)));

String shopModelToJson(List<ShopModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopModel {
  ShopModel({
    required this.id,
    required this.kategoriProduct,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String kategoriProduct;
  DateTime createdAt;
  DateTime updatedAt;

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        id: json["id"],
        kategoriProduct: json["kategoriProduct"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategoriProduct": kategoriProduct,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
