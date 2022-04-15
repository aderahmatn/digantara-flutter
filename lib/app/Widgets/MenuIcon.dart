import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuIcon extends StatelessWidget {
  final Size size;
  final IconData icon;
  final String title;
  final String page;
  MenuIcon(this.icon, this.size, this.title, this.page);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(page);
          },
          child: Container(
            height: size.height * 0.08,
            width: size.height * 0.08,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 0.8),
                      spreadRadius: 0.2,
                      blurRadius: 3)
                ]),
            child: Icon(
              icon,
              size: 35,
              color: dPrimaryColor,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: size.height * 0.08,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
