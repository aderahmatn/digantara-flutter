import 'package:digantara/app/modules/login/controllers/login_controller.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final LoginC = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: LoginC.isLogin.value == false
              ? controller.myWidgetNotLogin.elementAt(controller.tabIndex.value)
              : controller.myWidget.elementAt(controller.tabIndex.value),
          bottomNavigationBar: LoginC.isLogin.value == false
              ? BottomNavigationBar(
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
                )
              : BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.menu_book_rounded),
                      label: 'Berita',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      label: 'Jual Beli',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Beranda',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.report_problem_outlined),
                      label: 'SOS',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_none_rounded),
                      label: 'Notifikasi',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_outline_rounded),
                      label: 'Kontak',
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
                )),
    );
  }
}
