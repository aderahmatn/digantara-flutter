import 'dart:convert';

import 'package:digantara/app/Widgets/SnackbarCustom.dart';
import 'package:digantara/utils/Helpers.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  RxBool isLogin = false.obs;
  RxBool isLoading = false.obs;
  RxBool isComplete = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void checkLogin() {
    print('Checking TOKEN for API');
    print(GetStorage().read('token'));
    if (GetStorage().read('token') != null) {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
    print('isLogin : ${isLogin.value}');
  }

  void logout() {}
  void emailValidation(String value) {
    if (value.isEmpty) {
      emailError.value = 'Tidak boleh kosong';
    } else if (!isEmail(value)) {
      emailError.value = 'Email tidak valid';
    } else {
      emailError.value = '';
      checkForm();
    }
  }

  void passwordValidation(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Tidak boleh kosong';
    } else if (value.length < 6) {
      passwordError.value = 'Minimal 6 karakter';
    } else {
      passwordError.value = '';
      checkForm();
    }
  }

  void checkForm() {
    if (passwordError.value == "" || emailError.value == '') {
      isComplete.value = true;
    } else {
      isComplete.value = false;
    }
  }

  void submitLogin() async {
    try {
      isLoading.value = true;
      isComplete.value = false;
      var res = await http.post(Uri.parse('${baseUrl}api/login'), body: {
        'email': email.value.text,
        'password': password.value.text,
      });
      if (res.statusCode == 200) {
        var jsonRes = json.decode(res.body);
        print(jsonRes['data']['namaLengkap']);
        final storage = GetStorage();
        storage.write('token', jsonRes['access_token'].toString());
        storage.write('namaLengkap', jsonRes['data']['namaLengkap'].toString());
        print('Token : ${storage.read('token')}');
        print('Nama : ${storage.read('namaLengkap')}');
        isLogin.value = true;
        isLoading.value = false;
        isComplete.value = true;
        Get.back();
      } else {
        print(res.body);
        isLoading.value = false;
        isComplete.value = true;
        snackbarCustom('Terjadi Kesalahan',
            'Login gagal, silahkan periksa kembali email dan password anda');
      }
    } catch (e) {
      print(e);
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
