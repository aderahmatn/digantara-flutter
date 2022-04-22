import 'dart:convert';
import 'dart:io';

import 'package:digantara/app/modules/register/views/berhasil_view.dart';
import 'package:digantara/utils/Helpers.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final RxInt index = 0.obs;
  static RxBool isLoading = false.obs;
  static TextEditingController nik = TextEditingController();
  static TextEditingController username = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController cpassword = TextEditingController();
  static RxList penduduk = [].obs;
  static RxBool isDisable = true.obs;
  static RxString nikError = ''.obs;
  static RxString usernameError = ''.obs;
  static RxString phoneError = ''.obs;
  static RxString emailError = ''.obs;
  static RxString passwordError = ''.obs;
  static RxString cPasswordError = ''.obs;
  static File? fotoKtp;
  static RxString ktpBasename = ''.obs;
  static File? fotoSelfie;
  static RxString selfieBasename = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  static void submitRegitrasii() {
    print('id penduduk : ${penduduk[0]['idPenduduk']}');

    print('username : ${username.text}');
    print('password : ${password.text}');
    print('conf password : ${cpassword.text}');
    print('conf password : ${cpassword.text}');
    print('ktp : ${ktpBasename.value}');
    print('selfie : ${selfieBasename.value}');
    Get.off(() => BerhasilView());
  }

  static void submitRegitrasi() async {
    try {
      List<int> imageBytesKtp = fotoKtp!.readAsBytesSync();
      List<int> imageBytesSelfie = fotoSelfie!.readAsBytesSync();
      String baseimageKtp = base64Encode(imageBytesKtp);
      String baseimageSelfie = base64Encode(imageBytesSelfie);
      isLoading.value = true;
      // var res = await http.post(
      //   Uri.parse('${baseUrl}api/registrasi'),
      //   body: {
      //     'penduduk_id': penduduk[0]['idPenduduk'].toString(),
      //     'username': username.text,
      //     'email': email.text,
      //     'nomorTlp': phone.text,
      //     'password': password.text,
      //     'confrmpassword': cpassword.text,
      //     'fotoKtp': fotoKtp!.path,
      //     'fotoSelfie': fotoSelfie!.path
      //   },
      // );
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${baseUrl}api/registrasi'),
      );
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      request.files.add(
        http.MultipartFile(
          'fotoKtp',
          fotoKtp!.readAsBytes().asStream(),
          fotoKtp!.lengthSync(),
          filename: ktpBasename.toString(),
          // contentType: MediaType('image', 'jpeg'),
        ),
      );
      request.files.add(
        http.MultipartFile(
          'fotoSelfie',
          fotoSelfie!.readAsBytes().asStream(),
          fotoSelfie!.lengthSync(),
          filename: selfieBasename.toString(),
          // contentType: MediaType('image', 'jpeg'),
        ),
      );
      request.headers.addAll(headers);
      request.fields.addAll({
        'penduduk_id': penduduk[0]['idPenduduk'].toString(),
        'username': username.text,
        'email': email.text,
        'nomorTlp': phone.text,
        'password': password.text,
        'confrmpassword': cpassword.text,
      });
      print("request: " + request.toString());
      var res = await request.send();
      if (res.statusCode == 200) {
        print("This is response:" + res.toString());
        isLoading.value = false;
        Get.off(() => BerhasilView());
      } else {
        print(res.stream.toString());
        Get.snackbar(
          "Terjadi kesalahan",
          "Registrasi gagal",
          duration: Duration(seconds: 5),
          backgroundColor: Colors.amber,
          icon: Icon(Icons.warning, color: dPrimaryColor),
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = false;
      }
    } catch (e) {
      print('erorr boy : $e');
      Get.snackbar(
        "Data Tidak Sesuai",
        "Registrasi gagal",
        duration: Duration(seconds: 5),
        backgroundColor: Colors.amber,
        icon: Icon(Icons.warning, color: dPrimaryColor),
        snackPosition: SnackPosition.TOP,
      );
      isLoading.value = false;
    }
  }

  static void pickImageKtpFromGallery() async {
    final ktp = await ImagePicker().pickImage(source: ImageSource.gallery);
    fotoKtp = File(ktp!.path);
    ktpBasename.value = ktp.path;
    Get.back();
  }

  static void pickImageKtpFromCamera() async {
    final ktp = await ImagePicker().pickImage(source: ImageSource.camera);
    fotoKtp = File(ktp!.path);
    ktpBasename.value = ktp.path;
    Get.back();
  }

  static void pickImageSelfieFromGallery() async {
    final selfie = await ImagePicker().pickImage(source: ImageSource.gallery);
    fotoSelfie = File(selfie!.path);
    selfieBasename.value = selfie.path;
    Get.back();
  }

  static void pickImageSelfieFromCamera() async {
    final selfie = await ImagePicker().pickImage(source: ImageSource.camera);
    fotoSelfie = File(selfie!.path);
    selfieBasename.value = selfie.path;
    Get.back();
  }

  static void nikValidation(String value) {
    if (value.isEmpty) {
      nikError.value = 'Tidak boleh kosong';
    } else if (value.length < 16) {
      nikError.value = 'Minimal 6 karakter';
    } else {
      nikError.value = '';
    }
  }

  static void usernameValidation(String value) {
    if (value.isEmpty) {
      usernameError.value = 'Tidak boleh kosong';
    } else if (value.length < 4) {
      usernameError.value = 'Minimal 4 karakter';
    } else {
      usernameError.value = '';
    }
  }

  static void phoneValidation(String value) {
    if (value.isEmpty) {
      phoneError.value = 'Tidak boleh kosong';
    } else if (value.length < 11) {
      phoneError.value = 'Minimal 11 karakter';
    } else if (!isNumeric(value)) {
      phoneError.value = 'Harus berupa angka';
    } else {
      phoneError.value = '';
    }
  }

  static void emailValidation(String value) {
    if (value.isEmpty) {
      emailError.value = 'Tidak boleh kosong';
    } else if (!isEmail(value)) {
      emailError.value = 'Email tidak valid';
    } else {
      emailError.value = '';
    }
  }

  static void passwordValidation(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Tidak boleh kosong';
    } else if (value.length < 6) {
      passwordError.value = 'Minimal 6 karakter';
    } else {
      passwordError.value = '';
    }
  }

  static void cPasswordValidation(String value) {
    if (value.isEmpty) {
      cPasswordError.value = 'Tidak boleh kosong';
    } else if (value != password.text) {
      cPasswordError.value = 'Password tidak sama';
    } else {
      cPasswordError.value = '';
    }
  }

  static void checkNik(nikForCheck) async {
    try {
      isLoading.value = true;
      var res = await http.post(
        Uri.parse('${baseUrl}api/serchNik'),
        body: {'nik': nikForCheck},
      );
      if (res.statusCode == 200) {
        var resJson = json.decode(res.body);
        var resString = resJson['data'];

        penduduk.assignAll(resString);
        isDisable.value = false;
        isLoading.value = false;
      } else {
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
  void onClose() {
    nik.clear();
    username.clear();
    email.clear();
    password.clear();
    cpassword.clear();
    phone.clear();
    isDisable.value = true;
    ktpBasename.value = '';
    selfieBasename.value = '';
    penduduk.clear();
  }
}
