import 'package:get/get.dart';

import '../controllers/loker_controller.dart';

class LokerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LokerController>(
      () => LokerController(),
    );
  }
}
