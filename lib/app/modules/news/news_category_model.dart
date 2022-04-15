// To parse this JSON data, do
//
//     final newsCategoryModel = newsCategoryModelFromJson(jsonString);

import 'dart:convert';

List<NewsCategoryModel> newsCategoryModelFromJson(String str) =>
    List<NewsCategoryModel>.from(
        json.decode(str).map((x) => NewsCategoryModel.fromJson(x)));

String newsCategoryModelToJson(List<NewsCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsCategoryModel {
  NewsCategoryModel({
    required this.id,
    required this.kategoriBerita,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String kategoriBerita;
  DateTime createdAt;
  DateTime updatedAt;

  factory NewsCategoryModel.fromJson(Map<String, dynamic> json) =>
      NewsCategoryModel(
        id: json["id"],
        kategoriBerita: json["kategoriBerita"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategoriBerita": kategoriBerita,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
