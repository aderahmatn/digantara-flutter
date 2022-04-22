import 'package:digantara/app/Widgets/ButtonOutlineIcon.dart';
import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/ButtonSecondary.dart';
import 'package:digantara/app/routes/app_pages.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BerhasilView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dPrimaryColor,
      body: Center(
        child: Column(
          children: [
            Stack(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                height: Get.height / 2,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              Image(
                image: AssetImage(
                  'assets/images/success.png',
                ),
                width: Get.width + 100,
              ),
            ]),
            Text(
              'Pendaftaran Berhasil',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                'Silahkan menghubungi admin desa untuk melakukan aktivasi akun anda!',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 0.4,
                    height: 1.3),
              ),
            ),
            Container(
                margin: EdgeInsets.all(50),
                child: ButtonSecondary(
                    title: 'Kembali ke Beranda',
                    action: () {
                      Get.back();
                    }))
          ],
        ),
      ),
    );
  }
}
