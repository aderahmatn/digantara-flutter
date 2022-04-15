import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final void Function()? action;
  final bool? isDisable;
  ButtonPrimary({required this.title, required this.action, this.isDisable});
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
              onTap: isDisable != true ? action : () {},
              splashColor: Colors.red[100],
              splashFactory: isDisable == true
                  ? NoSplash.splashFactory
                  : InkSplash.splashFactory,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.all(16),
                // width: double.infinity,
                // height: double.infinity,
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
          color: isDisable == true ? Colors.grey : dPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
