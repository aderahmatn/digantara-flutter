import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

class ButtonOutlineIcon extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function() action;
  const ButtonOutlineIcon(
      {this.icon, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: InkWell(
          onTap: action,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: dPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: dPrimaryColor, width: 1.5),
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 15,
                    color: dPrimaryColor,
                  ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
