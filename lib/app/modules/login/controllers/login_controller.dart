import 'package:digantara/utils/Helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLogin = false.obs;
  RxBool isComplete = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void emailValidation(String value) {
    if (value.isEmpty) {
      emailError.value = 'Tidak boleh kosong';
    } else if (!isEmail(value)) {
      emailError.value = 'Email tidak valid';
    } else {
      emailError.value = '';
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
    email.dispose();
    password.dispose();
  }
}
