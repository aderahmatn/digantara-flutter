import 'package:get/get.dart';

class NotifikasiController extends GetxController {
  List notifList = [
    {
      'title': 'Forum Desa',
      'message': 'Ada warga berkomentar pada forum tangani covid 19 didesa',
      'date': '2 jam yang lalu',
      'hasOpen': true
    },
    {
      'title': 'Forum Desa',
      'message':
          'Ada warga berkomentar pada forum tangani penanggulangan longsor di desa cipayung ',
      'date': '5 jam yang lalu',
      'hasOpen': false
    },
    {
      'title': 'Pesan Kontak',
      'message': 'Ada pesan dari admin desa',
      'date': '5 jam yang lalu',
      'hasOpen': true
    },
    {
      'title': 'Pengajuan Dokumen',
      'message': 'Dokumen Anda Sedang diproses',
      'date': '8 jam yang lalu',
      'hasOpen': true
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
