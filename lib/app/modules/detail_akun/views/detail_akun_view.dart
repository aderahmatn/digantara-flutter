import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/ButtonText.dart';
import 'package:digantara/app/Widgets/DetailItem.dart';
import 'package:digantara/app/routes/app_pages.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/detail_akun_controller.dart';
import 'package:digantara/utils/StringExtention.dart';

class DetailAkunView extends GetView<DetailAkunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dPrimaryColor,
          elevation: 0,
          title: Text('Akun'),
          centerTitle: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: dDefaultPadding, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailItem(
                  title: 'NIK',
                  value: GetStorage().read('nik'),
                ),
                detailItem(
                  title: 'Nama Lengkap',
                  value:
                      GetStorage().read('namaLengkap').toString().toTitleCase(),
                ),
                detailItem(
                  title: 'Email',
                  value: 'e',
                ),
                detailItem(
                  title: 'Nomor Telepon',
                  value: GetStorage().read('nomorTlp'),
                ),
                detailItem(
                  title: 'Provinsi',
                  value: 'Jawa Barat',
                ),
                detailItem(
                  title: 'Kabupaten',
                  value: 'Majalengka',
                ),
                detailItem(
                  title: 'Kecamatan',
                  value: 'Cigasong',
                ),
                detailItem(
                  title: 'Desa',
                  value: 'Cigasong',
                ),
                SizedBox(height: 30),
                ButtonPrimary(
                    title: 'Ubah Akun',
                    action: () {
                      Get.toNamed(Routes.UBAH_AKUN);
                    }),
                SizedBox(height: 15),
                ButtonPrimary(
                    title: 'Ubah Password',
                    action: () {
                      Get.toNamed(Routes.UBAH_PASSWORD);
                    }),
                SizedBox(height: 15),
                ButtonText(
                    title: 'Keluar',
                    action: () {
                      Get.defaultDialog(
                          title: 'Konfirmasi Keluar',
                          content: Text('Keluar dari aplikasi DIGANTARA?'),
                          radius: 5,
                          buttonColor: dPrimaryColor,
                          cancelTextColor: dPrimaryColor,
                          confirmTextColor: Colors.white,
                          textConfirm: 'Tidak',
                          textCancel: 'Ya',
                          titlePadding: EdgeInsets.all(20),
                          titleStyle: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                          onCancel: controller.logout,
                          onConfirm: () {
                            Get.back();
                          });
                    })
              ],
            ),
          ),
        ));
  }
}
