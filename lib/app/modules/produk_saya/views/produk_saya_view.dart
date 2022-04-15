import 'package:digantara/app/Widgets/ProdukItem.dart';
import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/modules/produk_saya/views/tambah_produk_saya_view.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/produk_saya_controller.dart';

class ProdukSayaView extends GetView<ProdukSayaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Produk Saya'),
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
              produkItem(),
              produkItem(),
              produkItem(),
              produkItem(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: dPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.to(TambahProdukSayaView());
        },
        icon: Icon(
          FontAwesomeIcons.plus,
          size: 20,
        ),
        label: Text(
          'Produk Baru',
          style: TextStyle(letterSpacing: 0.1),
        ),
      ),
    );
  }
}
