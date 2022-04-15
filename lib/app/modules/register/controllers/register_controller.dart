import 'dart:convert';

import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final RxInt index = 0.obs;
  static RxBool isLoading = false.obs;
  static TextEditingController nik = TextEditingController();
  static TextEditingController username = TextEditingController();
  static RxList penduduk = [].obs;
  static RxList detailPenduduk = [
    {
      'penduduk_id': '',
      'email': '',
      'username': '',
      'password': '',
      'confrmpassword': '',
      'fotoKtp': '',
      'fotoSelfie': '',
    }
  ].obs;

  static RxBool isDisable = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  static void checkNik(nikForCheck) async {
    try {
      isLoading.value = true;
      var res = await http.post(
        Uri.parse('${baseUrl}api/serchNik'),
        body: {'nik': nikForCheck},
      );
      if (res.statusCode == 200) {
        var resString = json.decode(res.body);
        penduduk.assignAll(resString);
        print(penduduk.toString());
        isDisable.value = false;
        isLoading.value = false;
      } else {
        print(res.body.toString());
        Get.snackbar(
          "NIK Tidak Ditemukan",
          "Silahkan menghubungi admin desa anda",
          duration: Duration(seconds: 5),
          backgroundColor: Colors.amber,
          icon: Icon(Icons.warning, color: dPrimaryColor),
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = false;
      }
    } catch (e) {
      print('erorr boy : $e');
    }
  }

  @override
  void onClose() {}
}
