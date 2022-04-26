import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbarCustom(String title, String text) {
  Get.snackbar(
    title,
    text,
    duration: Duration(seconds: 5),
    backgroundColor: Colors.amber,
    icon: Icon(Icons.warning, color: dPrimaryColor),
    snackPosition: SnackPosition.TOP,
  );
}
