import 'package:get/get.dart';

import '../controllers/tani_desa_controller.dart';

class TaniDesaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaniDesaController>(
      () => TaniDesaController(),
    );
  }
}
