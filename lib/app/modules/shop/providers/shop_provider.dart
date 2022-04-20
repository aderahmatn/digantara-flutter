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
}
