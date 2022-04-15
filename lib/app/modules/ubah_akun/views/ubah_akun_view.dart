import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/PasswordInput.dart';
import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/Widgets/TextLabel.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ubah_akun_controller.dart';

class UbahAkunView extends GetView<UbahAkunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Ubah Akun'),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  TextLabel(title: 'NIK'),
                  TextInput(hint: '1234567891234566', isDisable: true),
                  SizedBox(height: 20),
                  TextLabel(title: 'Nama Lengkap'),
                  TextInput(hint: 'Ade Rahmat Nurdiyana', isDisable: true),
                  SizedBox(height: 20),
                  TextLabel(title: 'Username'),
                  TextInput(hint: 'aderahmatn', isDisable: true),
                  SizedBox(height: 20),
                  TextLabel(title: 'Nomor Telepon'),
                  TextInput(
                    hint: '0812237231',
                    isDisable: false,
                    type: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 20),
                  TextLabel(title: 'Email'),
                  TextInput(
                    hint: 'nurdiyana.ade@gmail.com',
                    isDisable: false,
                    type: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          ButtonPrimary(title: 'Simpan Perubahan', action: () {}),
          SizedBox(height: 30)
        ]),
      ),
    );
  }
}
