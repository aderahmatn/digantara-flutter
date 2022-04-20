import 'package:digantara/app/modules/news/banner_model.dart';
import 'package:digantara/utils/constant.dart';
import 'package:http/http.dart' as http;

class BannerProvider {
  static Future<List<BannerModel>?> fetchBanner() async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse('${baseUrl}api/banner'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return bannerModelFromJson(jsonString);
    }
  }
}
