// To parse required this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    required this.id,
    required this.kategoriBeritaId,
    required this.judulBerita,
    required this.gambar,
    required this.isiBerita,
    required this.viewCounter,
    required this.likeCounter,
    required this.createdAt,
    required this.updatedAt,
    required this.idKategori,
    required this.kategoriBerita,
  });

  int id;
  int kategoriBeritaId;
  String judulBerita;
  String gambar;
  String isiBerita;
  String viewCounter;
  String likeCounter;
  DateTime createdAt;
  DateTime updatedAt;
  int idKategori;
  String kategoriBerita;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        kategoriBeritaId: json["kategoriBerita_id"],
        judulBerita: json["judulBerita"],
        gambar: json["gambar"],
        isiBerita: json["isiBerita"],
        viewCounter: json["viewCounter"],
        likeCounter: json["likeCounter"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idKategori: json["idKategori"],
        kategoriBerita: json["kategoriBerita"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategoriBerita_id": kategoriBeritaId,
        "judulBerita": judulBerita,
        "gambar": gambar,
        "isiBerita": isiBerita,
        "viewCounter": viewCounter,
        "likeCounter": likeCounter,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "idKategori": idKategori,
        "kategoriBerita": kategoriBerita,
      };
}
