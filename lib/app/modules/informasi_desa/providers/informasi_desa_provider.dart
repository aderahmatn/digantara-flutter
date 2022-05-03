import 'package:digantara/app/modules/informasi_desa/informasi_desa_model.dart';
import 'package:digantara/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InformasiDesaProvider extends GetConnect {
  static Future<List<InformasiDesaModel>?> fetchInformasiDesa(
      int idDesa) async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse('${baseUrl}api/informasiDesa/$idDesa'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return informasiDesaModelFromJson(jsonString);
    }
  }
}
