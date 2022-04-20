import 'dart:convert';

import 'package:digantara/app/modules/shop/product_model.dart';
import 'package:digantara/app/modules/shop/shop_model.dart';
import 'package:digantara/utils/constant.dart';
import 'package:http/http.dart' as http;

class ShopProvider {
  static Future<List<ShopModel>?> fetchCategoryShop() async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse('${baseUrl}api/kategoriProduct'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return shopModelFromJson(jsonString);
    }
  }

  static Future<List<ProductModel>?> fetchProduct() async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse('${baseUrl}api/product'),
    );
    if (response.statusCode == 200) {
      var resJson = json.decode(response.body);
      // print(resJson['data'].runtimeType);
      // var jsonString = response.body;
      var jsonString = json.encode(resJson['data']);
      return productModelFromJson(jsonString);
    }
  }
}
