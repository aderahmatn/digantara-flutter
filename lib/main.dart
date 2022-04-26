import 'package:digantara/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import './utils/constant.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  GetStorage().read('token');
  runApp(
    Phoenix(
      child: GetMatApp(),
    ),
  );
}

class GetMatApp extends StatelessWidget {
  const GetMatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginC = Get.put(LoginController());
    return GetMaterialApp(
      onInit: LoginC.checkLogin,
      title: "DIGANTARA",
      theme: ThemeData(
        primaryColor: dPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: dTextColor),
        scaffoldBackgroundColor: Colors.white,
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
