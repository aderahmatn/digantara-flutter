import 'package:flutter/material.dart';

import 'package:digantara/utils/constant.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final bool isDisable;
  final TextInputType? type;
  final TextInputAction? textInputAction;
  final int? maxline;
  final void Function()? action;
  final TextEditingController? controller;
  TextInput(
      {required this.hint,
      required this.isDisable,
      this.type,
      this.textInputAction,
      this.maxline,
      this.controller,
      this.action});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: action,
      controller: controller,
      maxLines: (maxline == null) ? 1 : maxline,
      keyboardType: type,
      textInputAction: textInputAction,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        hintText: hint,
        filled: true,
        enabled: !isDisable,
        fillColor: isDisable ? Colors.grey[300] : dPrimaryColorForm,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}
