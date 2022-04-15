import 'package:get/get.dart';

import '../controllers/ubah_akun_controller.dart';

class UbahAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahAkunController>(
      () => UbahAkunController(),
    );
  }
}
