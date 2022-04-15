import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget {
  final String title;
  AppbarCustom({required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: dPrimaryColor,
      elevation: 0,
      title: Text(title),
      centerTitle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
    );
  }
}
