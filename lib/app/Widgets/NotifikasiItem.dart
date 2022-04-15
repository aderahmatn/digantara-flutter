import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

class NotifikasiItem extends StatelessWidget {
  final String title;
  final String message;
  final String date;
  final bool hasRead;

  NotifikasiItem(
      {required this.title,
      required this.message,
      required this.date,
      required this.hasRead});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: hasRead ? Colors.white : dPrimaryColor.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(width: 0.1),
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: dDefaultPadding, vertical: dDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            message,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
