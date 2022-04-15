import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/DropdownCustom.dart';
import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/Widgets/TextLabel.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BuatPengajuanDokumenView extends GetView {
  final List<String> kategori = [
    'Surat pengantar nikah',
    'Bantuan langsung tunai (BLT)',
    'Surat keterangan penduduk',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Buat Pengajuan Dokumen'),
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
                  TextLabel(title: 'Kategori'),
                  DropdownInputCustom(
                      hint: 'Pilih kategori dokumen', items: kategori),
                  TextLabel(title: 'Keterangan Pengajuan Dokumen'),
                  TextInput(
                    hint: '',
                    isDisable: false,
                    maxline: 6,
                  ),
                  SizedBox(height: 20),
                  TextLabel(title: 'Lampiran (maksimal 10Mb)'),
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
        height: 155,
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                  text:
                      'Dengan menekan tombol Buat Pengajuan, anda memastikan bahwa informasi yang anda ajukan sudah benar, segala kekeliruan dalam melakukan permohonan surat tidak dapat diubah.'),
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 15),
            ButtonPrimary(title: 'Buat Pengajuan', action: () {}),
          ],
        ),
      ),
    );
  }
}
