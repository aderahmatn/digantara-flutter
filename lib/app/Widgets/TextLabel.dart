import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String title;
  TextLabel({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
