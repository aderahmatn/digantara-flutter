import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/PasswordInput.dart';
import 'package:digantara/app/Widgets/TextLabel.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_password_controller.dart';

class UbahPasswordView extends GetView<UbahPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Ubah Password'),
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                TextLabel(title: 'Kata Sandi Lama'),
                PasswordInput(
                  hint: 'Masukan kata sandi lama',
                ),
                SizedBox(height: 20),
                TextLabel(title: 'Kata Sandi Baru'),
                PasswordInput(
                  hint: 'Masukan kata sandi baru',
                ),
                SizedBox(height: 20),
                TextLabel(title: 'Ulangi Kata Sandi Baru'),
                PasswordInput(
                  hint: 'Ulangi kata sandi baru',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          ButtonPrimary(title: 'Simpan Perubahan', action: () {}),
          SizedBox(height: 30)
        ]),
      ),
    );
  }
}
