import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  final String title;
  final void Function()? action;
  ButtonSecondary({required this.title, required this.action});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        child: Center(
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            child: InkWell(
              onTap: action,
              splashColor: Colors.red[100],
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
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
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
