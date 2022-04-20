// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.idProduct,
    required this.id,
    required this.pendudukId,
    required this.namaProduct,
    required this.nomorTlpPenjual,
    required this.desckripsiProduct,
    required this.hargaProduct,
    required this.qtyProduct,
    required this.createdAt,
    required this.updatedAt,
    required this.kategoriProduct,
    required this.idDetailProduct,
    required this.productId,
    required this.kategoriProductId,
    required this.fotoProduct,
    required this.idPenduduk,
    required this.namaLengkap,
    required this.idDesa,
    required this.namaDesa,
    required this.idKecamatan,
    required this.namaKecamatan,
    required this.idKabupaten,
    required this.namaKabupaten,
    required this.idProvinsi,
    required this.namaProvinsi,
  });

  int idProduct;
  int id;
  int pendudukId;
  String namaProduct;
  String nomorTlpPenjual;
  String desckripsiProduct;
  String hargaProduct;
  String qtyProduct;
  DateTime createdAt;
  DateTime updatedAt;
  String kategoriProduct;
  int idDetailProduct;
  int productId;
  int kategoriProductId;
  String fotoProduct;
  int idPenduduk;
  String namaLengkap;
  String idDesa;
  String namaDesa;
  String idKecamatan;
  String namaKecamatan;
  String idKabupaten;
  String namaKabupaten;
  String idProvinsi;
  String namaProvinsi;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        idProduct: json["idProduct"],
        id: json["id"],
        pendudukId: json["penduduk_id"],
        namaProduct: json["namaProduct"],
        nomorTlpPenjual: json["nomorTlpPenjual"],
        desckripsiProduct: json["desckripsiProduct"],
        hargaProduct: json["hargaProduct"],
        qtyProduct: json["qtyProduct"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        kategoriProduct: json["kategoriProduct"],
        idDetailProduct: json["idDetailProduct"],
        productId: json["product_id"],
        kategoriProductId: json["kategoriProduct_id"],
        fotoProduct: json["fotoProduct"],
        idPenduduk: json["idPenduduk"],
        namaLengkap: json["namaLengkap"],
        idDesa: json["idDesa"],
        namaDesa: json["namaDesa"],
        idKecamatan: json["idKecamatan"],
        namaKecamatan: json["namaKecamatan"],
        idKabupaten: json["idKabupaten"],
        namaKabupaten: json["namaKabupaten"],
        idProvinsi: json["idProvinsi"],
        namaProvinsi: json["namaProvinsi"],
      );

  Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "id": id,
        "penduduk_id": pendudukId,
        "namaProduct": namaProduct,
        "nomorTlpPenjual": nomorTlpPenjual,
        "desckripsiProduct": desckripsiProduct,
        "hargaProduct": hargaProduct,
        "qtyProduct": qtyProduct,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "kategoriProduct": kategoriProduct,
        "idDetailProduct": idDetailProduct,
        "product_id": productId,
        "kategoriProduct_id": kategoriProductId,
        "fotoProduct": fotoProduct,
        "idPenduduk": idPenduduk,
        "namaLengkap": namaLengkap,
        "idDesa": idDesa,
        "namaDesa": namaDesa,
        "idKecamatan": idKecamatan,
        "namaKecamatan": namaKecamatan,
        "idKabupaten": idKabupaten,
        "namaKabupaten": namaKabupaten,
        "idProvinsi": idProvinsi,
        "namaProvinsi": namaProvinsi,
      };
}
