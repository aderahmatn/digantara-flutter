import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/modules/informasi_desa/views/detail_informasi_view.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/informasi_desa_controller.dart';

class InformasiDesaView extends GetView<InformasiDesaController> {
  @override
  Widget build(BuildContext context) {
    var infoDesaC = Get.put(InformasiDesaController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Infromasi Desa'),
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
            SizedBox(height: 15),
            informasiItem(),
            informasiItem(),
            informasiItem(),
            informasiItem(),
            informasiItem(),
            informasiItem(),
          ],
        ),
      )),
    );
  }
}

class informasiItem extends StatelessWidget {
  const informasiItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailInformasiView(),
            ),
          );
        },
        child: Card(
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(dDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // margin: EdgeInsets.all(8),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/banner5.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Kerjabakti dusun sukarame',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '12 jam yang lalu',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.eye,
                          size: 13,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '10',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
