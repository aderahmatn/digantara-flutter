// To parse this JSON data, do
//
//     final informasiDesaModel = informasiDesaModelFromJson(jsonString);

import 'dart:convert';

List<InformasiDesaModel> informasiDesaModelFromJson(String str) =>
    List<InformasiDesaModel>.from(
        json.decode(str).map((x) => InformasiDesaModel.fromJson(x)));

String informasiDesaModelToJson(List<InformasiDesaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InformasiDesaModel {
  InformasiDesaModel({
    required this.idInformasiDesa,
    required this.id,
    required this.judulInformasiDesa,
    required this.status,
    required this.keteranganInformasiDesa,
    required this.view,
    required this.likeCounter,
    required this.createdAt,
    required this.updatedAt,
    required this.informasiDesaId,
    required this.desaId,
    required this.gambarInformasiDesa,
  });

  int idInformasiDesa;
  int id;
  String judulInformasiDesa;
  String status;
  String keteranganInformasiDesa;
  int view;
  dynamic likeCounter;
  DateTime createdAt;
  DateTime updatedAt;
  int informasiDesaId;
  int desaId;
  String gambarInformasiDesa;

  factory InformasiDesaModel.fromJson(Map<String, dynamic> json) =>
      InformasiDesaModel(
        idInformasiDesa: json["idInformasiDesa"],
        id: json["id"],
        judulInformasiDesa: json["judulInformasiDesa"],
        status: json["status"],
        keteranganInformasiDesa: json["keteranganInformasiDesa"],
        view: json["view"],
        likeCounter: json["likeCounter"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        informasiDesaId: json["informasiDesa_id"],
        desaId: json["desa_id"],
        gambarInformasiDesa: json["gambarInformasiDesa"],
      );

  Map<String, dynamic> toJson() => {
        "idInformasiDesa": idInformasiDesa,
        "id": id,
        "judulInformasiDesa": judulInformasiDesa,
        "status": status,
        "keteranganInformasiDesa": keteranganInformasiDesa,
        "view": view,
        "likeCounter": likeCounter,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "informasiDesa_id": informasiDesaId,
        "desa_id": desaId,
        "gambarInformasiDesa": gambarInformasiDesa,
      };
}
