import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

class TextInputIcon extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final IconData icon;
  final void Function()? onComplete;
  TextInputIcon(
      {required this.hint,
      required this.icon,
      this.controller,
      this.onComplete});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: onComplete,
      controller: controller,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: dPrimaryColor,
          size: 18,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        hintText: hint,
        filled: true,
        fillColor: dPrimaryColorForm,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}
