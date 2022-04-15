import 'package:flutter/material.dart';

import 'package:digantara/utils/constant.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final void Function()? action;
  ButtonText({required this.title, required this.action});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        child: Center(
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Center(
                child: InkWell(
                  onTap: action,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: dPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
