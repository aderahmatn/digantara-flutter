import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/routes/app_pages.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/pengajuan_dokumen_controller.dart';

class PengajuanDokumenView extends GetView<PengajuanDokumenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Pengajuan Dokumen'),
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(dDefaultPadding),
          child: Column(
            children: [
              TextInput(hint: 'Cari..', isDisable: false),
              SizedBox(height: 5),
              ListileCustom(),
              ListileCustom(),
              ListileCustom(),
              ListileCustom(),
              ListileCustom(),
              ListileCustom(),
              ListileCustom(),
              ListileCustom(),
              ListileCustom(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: dPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.toNamed(Routes.BUAT_PENGAJUAN_DOKUMEN);
        },
        icon: Icon(
          FontAwesomeIcons.plus,
          size: 20,
        ),
        label: Text(
          'Buat Baru',
          style: TextStyle(letterSpacing: 0.1),
        ),
      ),
    );
  }
}

class ListileCustom extends StatelessWidget {
  const ListileCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 1,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        onTap: () {
          Get.toNamed(Routes.DETAIL_PENGAJUAN_DOKUMEN);
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('3B'),
            Text(
              'Permohonan Pengantar Nikah',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: Text(
          '2 hari yang lalu',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        trailing: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.amber,
            ),
            child: Text(
              'Diajukan',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )),
      ),
    );
  }
}
