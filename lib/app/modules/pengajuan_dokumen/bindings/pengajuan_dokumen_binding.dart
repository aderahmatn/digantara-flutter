import 'package:get/get.dart';

import '../controllers/pengajuan_dokumen_controller.dart';

class PengajuanDokumenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanDokumenController>(
      () => PengajuanDokumenController(),
    );
  }
}
