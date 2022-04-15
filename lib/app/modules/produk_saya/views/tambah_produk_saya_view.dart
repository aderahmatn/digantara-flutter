import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/DropdownCustom.dart';
import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/Widgets/TextLabel.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class TambahProdukSayaView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Tambah Produk Baru'),
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(dDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextLabel(title: 'Nama Produk'),
                  TextInput(
                    hint: '',
                    isDisable: false,
                  ),
                  SizedBox(height: 20),
                  TextLabel(title: 'Harga'),
                  TextInput(
                    hint: 'Contoh : 400000',
                    isDisable: false,
                    type: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextLabel(title: 'Kategori Produk'),
                  DropdownInputCustom(
                      hint: 'Pilih kategori produk', items: ['a', 'b']),
                  TextLabel(title: 'Deskripsi Produk'),
                  TextInput(
                    hint: '',
                    isDisable: false,
                    maxline: 6,
                  ),
                  SizedBox(height: 20),
                  TextLabel(title: 'Foto Produk (maksimal 10Mb)'),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Card(
                            elevation: 2,
                            child: Icon(
                              FontAwesomeIcons.plusCircle,
                              size: 30,
                              color: dPrimaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(dDefaultPadding),
        height: 100,
        child: Column(
          children: [
            ButtonPrimary(title: 'Tambah Produk', action: () {}),
          ],
        ),
      ),
    );
  }
}
