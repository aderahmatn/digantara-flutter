import 'package:digantara/app/Widgets/ButtonOutlineIcon.dart';
import 'package:digantara/app/Widgets/ButtonPrimary.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DetailShopView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Detail Produk'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.all(8),
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner5.png'),
                      fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: dPrimaryColor,
                  ),
                  Text(
                    'Majalengka',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Rexus Mouse Wirelles Xierra 20Xp',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Rp530.000',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              SizedBox(height: 15),
              Text.rich(
                TextSpan(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
                  style:
                      TextStyle(color: Colors.black, height: 1.5, fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.userAlt,
                          size: 12,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Agus Suseno',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.tag,
                          size: 12,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 7),
                        Text(
                          '2 Hari yang lalu',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            padding: EdgeInsets.all(dDefaultPadding),
            height: 170,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hubungi Penjual :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                ButtonOutlineIcon(
                  title: 'Whatsapp',
                  action: () {},
                  icon: FontAwesomeIcons.whatsapp,
                ),
                SizedBox(height: 15),
                ButtonOutlineIcon(
                  title: 'Telepon',
                  action: () {},
                  icon: FontAwesomeIcons.phone,
                )
              ],
            )),
      ),
    );
  }
}
