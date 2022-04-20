// ignore_for_file: must_be_immutable

import 'package:digantara/app/modules/news/controllers/news_controller.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import '../../utils/StringExtention.dart';

class CategoryItem extends StatelessWidget {
  String category;
  bool isActive;
  String idCategori;
  void Function() onTap;

  CategoryItem(this.category, this.isActive, this.idCategori, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 14),
        child: Center(
          child: Text(
            category.capitalize(),
            style: TextStyle(
                fontSize: 14,
                color: isActive ? Colors.white : dTextColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        decoration: BoxDecoration(
          color: isActive ? dPrimaryColor : dPrimaryColor.withOpacity(0.1),
          border: Border.all(width: 1, color: dPrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
