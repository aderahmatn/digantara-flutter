import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLogin = false.obs;
  RxBool isComplete = false.obs;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void onComplete() {
    if (username.value.text != '') {
      print(username.value.text);
    } else {
      print('Username tidak boleh kosong bro!');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
  }
}
