import 'package:digantara/app/modules/informasi_desa/providers/informasi_desa_provider.dart';
import 'package:get/get.dart';

class InformasiDesaController extends GetxController {
  static RxBool isLoading = true.obs;
  static RxList informasiDesaList = [].obs;
  static int idDesa = 3201020002;

  getInformasiDesa() async {
    isLoading(true);
    try {
      print('get informasi desa');
      var informasiDesa =
          await InformasiDesaProvider.fetchInformasiDesa(idDesa);
      if (informasiDesa != null) {
        informasiDesaList.assignAll(informasiDesa);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getInformasiDesa();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
