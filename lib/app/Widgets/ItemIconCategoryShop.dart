// ignore_for_file: must_be_immutable

import 'package:digantara/utils/constant.dart';

import 'package:flutter/material.dart';

class ItemIconCategoryShop extends StatelessWidget {
  final IconData icon;
  final String title;
  bool isSelected;
  ItemIconCategoryShop(this.icon, this.title, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: isSelected
                      ? dPrimaryColor.withOpacity(0.3)
                      : dPrimaryColor),
              color:
                  isSelected ? dPrimaryColor : dPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              size: 35,
              color: isSelected ? Colors.white : dPrimaryColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
