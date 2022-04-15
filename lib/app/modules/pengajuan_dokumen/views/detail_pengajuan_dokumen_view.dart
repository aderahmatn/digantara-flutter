import 'package:digantara/app/Widgets/ButtonOutlineIcon.dart';
import 'package:digantara/app/Widgets/ButtonText.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class DetailPengajuanDokumenView extends GetView {
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(dDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    onTap: () {},
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
                  ),
                  Text.rich(
                    TextSpan(
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Lampiran :',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 15),
                  ButtonOutlineIcon(
                    title: 'Unduh lampiran',
                    action: () {},
                    icon: FontAwesomeIcons.download,
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            Padding(
              padding: EdgeInsets.all(dDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Riwayat Pengajuan Dokumen :',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  RiwayatListItem(),
                  RiwayatListItem(),
                  RiwayatListItem(),
                  RiwayatListItem(),
                  RiwayatListItem(),
                  RiwayatListItem(),
                  RiwayatListItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RiwayatListItem extends StatelessWidget {
  const RiwayatListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        bottom: BorderSide(width: 0.1, color: Colors.grey),
      ),
      contentPadding: EdgeInsets.all(0),
      title: Text(
        '[17 Maret 2021 - 19.47]',
        style: TextStyle(fontSize: 15),
      ),
      subtitle: Text('Diproses', style: TextStyle(fontSize: 13)),
    );
  }
}
