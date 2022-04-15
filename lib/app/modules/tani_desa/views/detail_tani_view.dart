import 'package:digantara/app/Widgets/ButtonOutlineIcon.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class DetailTaniView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Detail Infromasi'),
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
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner5.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Judul Informasi Tani Desa',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                child: Row(
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
              ),
              SizedBox(height: 15),
              Text.rich(
                TextSpan(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                  style:
                      TextStyle(color: Colors.black, height: 1.5, fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 15),
              Text(
                'Lampiran :',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(height: 15),
              ButtonOutlineIcon(
                title: 'Unduh Lampiran',
                action: () {},
                icon: FontAwesomeIcons.download,
              )
            ],
          ),
        ),
      ),
    );
  }
}
