import 'package:digantara/app/modules/home/controllers/home_controller.dart';
import 'package:digantara/app/modules/login/controllers/login_controller.dart';
import 'package:digantara/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailAkunController extends GetxController {
  var LoginC = Get.put(LoginController());
  var HomeC = Get.put(HomeController());
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

  void logout() async {
    LoginC.isLogin.value = false;
    await GetStorage().remove('token');
    await GetStorage().remove('namaLengkap');
    HomeC.changeTabIndex(0);
    Get.back();
  }
}
