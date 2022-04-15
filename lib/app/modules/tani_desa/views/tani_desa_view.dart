import 'package:digantara/app/Widgets/ItemIconCategoryShop.dart';
import 'package:digantara/app/modules/tani_desa/views/detail_tani_view.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/tani_desa_controller.dart';

class TaniDesaView extends GetView<TaniDesaController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Theme(
          data: ThemeData(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: dPrimaryColor,
                ),
          ),
          child: TextField(
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: 'Cari..',
              prefixIcon: Icon(Icons.search_rounded),
              contentPadding: EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: dPrimaryColor.withOpacity(0.6), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: dPrimaryColor.withOpacity(0.5), width: 1),
              ),
            ),
          ),
        ),
        toolbarHeight: size.height * 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dDefaultPadding,
              ),
              child: Text(
                'Kategori Pertanian',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  ItemIconCategoryShop(CupertinoIcons.cube_box, 'Semua', true),
                  ItemIconCategoryShop(
                      CupertinoIcons.leaf_arrow_circlepath, 'Pertanian', false),
                  ItemIconCategoryShop(
                      CupertinoIcons.guitars, 'Perhutanan', false),
                  ItemIconCategoryShop(
                      CupertinoIcons.camera_on_rectangle, 'Perkebunan', false),
                  ItemIconCategoryShop(
                      CupertinoIcons.arrow_up_bin, 'Hasil Tani', false),
                  ItemIconCategoryShop(
                      CupertinoIcons.circle_grid_hex, 'Kecantikan', false),
                  ItemIconCategoryShop(
                      CupertinoIcons.car_detailed, 'Kendaraan', false),
                ],
              ),
            ),
            SizedBox(height: 15),
            taniDesaItem(),
            taniDesaItem(),
            taniDesaItem(),
          ],
        ),
      ),
    );
  }
}

class taniDesaItem extends StatelessWidget {
  const taniDesaItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Get.to(DetailTaniView());
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
                        '12 April 2021 - 19.21',
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
      ),
    );
  }
}
