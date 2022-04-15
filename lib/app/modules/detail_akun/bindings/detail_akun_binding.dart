import 'package:get/get.dart';

import '../controllers/detail_akun_controller.dart';

class DetailAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAkunController>(
      () => DetailAkunController(),
    );
  }
}
