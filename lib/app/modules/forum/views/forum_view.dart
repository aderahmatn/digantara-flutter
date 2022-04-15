import 'package:digantara/app/Widgets/AppbarCustom.dart';
import 'package:digantara/app/Widgets/CategoryItem.dart';
import 'package:digantara/app/Widgets/TextInput.dart';
import 'package:digantara/app/modules/forum/views/buat_forum_view.dart';
import 'package:digantara/app/modules/forum/views/detail_forum_view.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/forum_controller.dart';

class ForumView extends GetView<ForumController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        elevation: 0,
        title: Text('Forum Warga'),
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    // CategoryItem('Semua', true),
                    // CategoryItem('Kategori 1', false),
                    // CategoryItem('Kategori 2', false),
                    // CategoryItem('Kategori 3', false),
                    // CategoryItem('Kategori 4', false),
                    // CategoryItem('Kategori 5', false),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: dDefaultPadding),
                child: Column(
                  children: [
                    TextInput(hint: 'Cari topik forum..', isDisable: false),
                    SizedBox(height: 15),
                    ForumItem(),
                    ForumItem(),
                    ForumItem()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: dPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.to(BuatForumView());
        },
        icon: Icon(
          FontAwesomeIcons.plus,
          size: 20,
        ),
        label: Text(
          'Buat Baru',
          style: TextStyle(letterSpacing: 0.1),
        ),
      ),
    );
  }
}

class ForumItem extends StatelessWidget {
  const ForumItem({
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
              builder: (context) => DetailForumView(),
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
                        image: AssetImage('assets/images/banner6.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Kesehatan',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: dPrimaryColor),
                ),
                SizedBox(height: 5),
                Text(
                  'Penanganan COVID-19 Di desa',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '20 Januari 2022 - 19.12',
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
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.comments,
                          size: 13,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '35',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
