import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_user_controller.dart';

class HomeUserView extends GetView<HomeUserController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeUserController());
    return Scaffold(
      body: controller.myWidget.elementAt(controller.tabIndex.value),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Berita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Jual Beli',
          ),
        ],
        selectedItemColor: dPrimaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 8,
        currentIndex: controller.tabIndex.value,
        onTap: (value) => controller.changeTabIndex(value),
      ),
    );
  }
}
