import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/app/Widgets/DropdownCustom.dart';
import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/Widgets/TextLabel.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class BuatForumView extends GetView {
  final List<String> kategori = [
    'Ekonomi',
    'Kesehatan',
    'Pertanian',
    'Perayaan',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Buat Forum Baru'),
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
                  TextLabel(title: 'Judul Forum'),
                  TextInput(hint: 'Judul forum', isDisable: false),
                  SizedBox(height: 20),
                  TextLabel(title: 'Kategori Forum'),
                  DropdownInputCustom(
                      hint: 'Pilih kategori forum', items: kategori),
                  TextLabel(title: 'Deskripsi Forum'),
                  TextInput(
                    hint: '',
                    isDisable: false,
                    maxline: 6,
                  ),
                  SizedBox(height: 20),
                  TextLabel(title: 'Foto Forum (maksimal 10Mb)'),
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
        height: 85,
        child: ButtonPrimary(title: 'Tambah Forum', action: () {}),
      ),
    );
  }
}
