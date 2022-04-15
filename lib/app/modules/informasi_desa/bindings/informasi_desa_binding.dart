import 'package:get/get.dart';

import '../controllers/informasi_desa_controller.dart';

class InformasiDesaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformasiDesaController>(
      () => InformasiDesaController(),
    );
  }
}
