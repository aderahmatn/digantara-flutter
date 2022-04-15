import 'package:digantara/app/modules/news/news_category_model.dart';
import 'package:digantara/utils/constant.dart';

import '../news_model.dart';
import 'package:http/http.dart' as http;

class NewsProvider {
  static Future<List<NewsModel>?> fetchNews({catNews}) async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse('${baseUrl}api/berita/${catNews}'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsModelFromJson(jsonString);
    }
  }

  static Future<List<NewsCategoryModel>?> fetchNewsCategory() async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse('${baseUrl}api/kategoriBerita'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsCategoryModelFromJson(jsonString);
    }
  }
}
