import 'package:digantara/app/Widgets/NotifikasiItem.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  @override
  Widget build(BuildContext context) {
    Get.put(NotifikasiController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Notifikasi'),
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.notifList.length,
          itemBuilder: (context, index) {
            return NotifikasiItem(
                title: controller.notifList[index]['title'],
                message: controller.notifList[index]['message'],
                date: controller.notifList[index]['date'],
                hasRead: controller.notifList[index]['hasOpen']);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: dPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          // Get.to(TambahProdukSayaView());
        },
        label: Text(
          'Tandai semua dibaca',
          style: TextStyle(letterSpacing: 0.1),
        ),
      ),
    );
  }
}
