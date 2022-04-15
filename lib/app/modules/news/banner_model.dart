// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  BannerModel({
    required this.idBerita,
    required this.judulBerita,
    required this.isiBerita,
    required this.idKategori,
    required this.kategoriBerita,
    required this.idBanner,
    required this.type,
    required this.status,
    required this.hyperLink,
    required this.gambarBanner,
  });

  String idBerita;
  String judulBerita;
  String isiBerita;
  String idKategori;
  String kategoriBerita;
  int idBanner;
  String type;
  String status;
  String hyperLink;
  String gambarBanner;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        idBerita: json["idBerita"],
        judulBerita: json["judulBerita"],
        isiBerita: json["isi_Berita"],
        idKategori: json["idKategori"],
        kategoriBerita: json["kategoriBerita"],
        idBanner: json["idBanner"],
        type: json["type"],
        status: json["status"],
        hyperLink: json["hyperLink"],
        gambarBanner: json["gambarBanner"],
      );

  Map<String, dynamic> toJson() => {
        "idBerita": idBerita,
        "judulBerita": judulBerita,
        "isi_Berita": isiBerita,
        "idKategori": idKategori,
        "kategoriBerita": kategoriBerita,
        "idBanner": idBanner,
        "type": type,
        "status": status,
        "hyperLink": hyperLink,
        "gambarBanner": gambarBanner,
      };
}
