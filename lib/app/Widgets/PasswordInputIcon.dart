import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordInputIcon extends StatefulWidget {
  @override
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? errorText;
  final TextInputType? type;
  State<PasswordInputIcon> createState() => _PasswordInputIconState();
  PasswordInputIcon(
      {this.controller, this.errorText, this.onChanged, this.type});
}

class _PasswordInputIconState extends State<PasswordInputIcon> {
  var isHidden = true;

  void passText() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: isHidden,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
      decoration: InputDecoration(
        errorText: widget.errorText,
        errorStyle: TextStyle(color: Colors.amber),
        prefixIcon: Icon(
          FontAwesomeIcons.lock,
          size: 18,
          color: dPrimaryColor,
        ),
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
        hintText: 'Password',
        filled: true,
        fillColor: dPrimaryColorForm,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}
