import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordInput extends StatefulWidget {
  @override
  State<PasswordInput> createState() => _PasswordInputState();
  final String? hint;
  final String? errorText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  const PasswordInput(
      {Key? key,
      this.hint,
      this.controller,
      this.errorText,
      this.onChanged,
      this.textInputAction})
      : super(key: key);
}

class _PasswordInputState extends State<PasswordInput> {
  var isHidden = true;

  void passText() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: isHidden,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
      decoration: InputDecoration(
        errorText: widget.errorText,
        suffixIcon: IconButton(
          onPressed: () {
            passText();
          },
          icon: Icon(
            isHidden
                ? FontAwesomeIcons.solidEye
                : FontAwesomeIcons.solidEyeSlash,
            size: 16,
            color: Colors.black54,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        hintText: widget.hint,
        filled: true,
        fillColor: dPrimaryColorForm,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}
