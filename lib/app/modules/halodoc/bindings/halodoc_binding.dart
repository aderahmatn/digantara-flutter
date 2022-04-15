import 'package:get/get.dart';

import '../controllers/halodoc_controller.dart';

class HalodocBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HalodocController>(
      () => HalodocController(),
    );
  }
}
