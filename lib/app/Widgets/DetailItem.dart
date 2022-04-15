import 'package:flutter/material.dart';

class detailItem extends StatelessWidget {
  final String title;
  final String value;
  detailItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ],
    );
  }
}
