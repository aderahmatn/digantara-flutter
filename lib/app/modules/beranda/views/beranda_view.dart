import 'package:digantara/app/Widgets/MenuIcon.dart';
import 'package:digantara/app/Widgets/UsernameCard.dart';
import 'package:digantara/app/routes/app_pages.dart';
import 'package:digantara/utils/StringExtention.dart' as strExtention;
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:get/get.dart';

import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage('assets/images/brand.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: size.height * 0.08,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.3 - 210,
                    decoration: BoxDecoration(
                      color: dPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 54,
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            // offset: Offset(0, 0),
                            blurRadius: 15,
                            color: dPrimaryColor.withOpacity(0.3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_AKUN);
                              },
                              child: UsernameCard(
                                name: GetStorage().read('namaLengkap'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
              child: Text(
                'Administrasi Desa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dDefaultPadding,
              ),
              child: Row(
                children: [
                  MenuIcon(FontAwesomeIcons.solidFileAlt, size,
                      'Pengajuan Dokumen', Routes.PENGAJUAN_DOKUMEN),
                  SizedBox(width: 20),
                  MenuIcon(FontAwesomeIcons.solidStar, size, 'Informasi Desa',
                      Routes.INFORMASI_DESA),
                  SizedBox(width: 20),
                  MenuIcon(FontAwesomeIcons.landmark, size, 'Profil Desa Saya',
                      Routes.PROFIL_DESA),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
              child: Text(
                'Forum Sosial Warga Desa',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dDefaultPadding,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuIcon(FontAwesomeIcons.solidSmile, size,
                      'Forum Warga Desa ', Routes.FORUM),
                  SizedBox(width: 20),
                  MenuIcon(FontAwesomeIcons.briefcaseMedical, size,
                      'Kesehatan Desa ', Routes.HALODOC),
                  SizedBox(width: 20),
                  MenuIcon(FontAwesomeIcons.briefcase, size, 'Loker & Jasa',
                      Routes.LOKER),
                  SizedBox(width: 20),
                  MenuIcon(FontAwesomeIcons.tractor, size, 'Tani Desa',
                      Routes.TANI_DESA),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
              child: Text(
                'Ekonomi Desa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dDefaultPadding,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuIcon(FontAwesomeIcons.shoppingCart, size,
                      'Jual Beli Barang ', Routes.SHOP),
                  SizedBox(width: 20),
                  MenuIcon(FontAwesomeIcons.shoppingBag, size, 'Produk Saya ',
                      Routes.PRODUK_SAYA),
                  SizedBox(width: 20),
                  MenuIcon(
                      FontAwesomeIcons.mobileAlt, size, 'PPOB', Routes.BERANDA),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: Center(
                child: InkWell(
                  onTap: () {
                    launch("tel:087776451664");
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    width: 300,
                    decoration: BoxDecoration(
                      color: dPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: dPrimaryColor, width: 1.5),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.phoneAlt,
                          size: 15,
                          color: dPrimaryColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Hubungi Customer Sevice',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
