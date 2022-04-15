import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import './utils/constant.dart';

void main() {
  runApp(
    GetMatApp(),
  );
}

class GetMatApp extends StatelessWidget {
  const GetMatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
