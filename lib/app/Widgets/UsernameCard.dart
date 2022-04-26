import 'package:digantara/utils/StringExtention.dart';
import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UsernameCard extends StatelessWidget {
  final String name;
  UsernameCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidUserCircle,
          color: dPrimaryColor,
          size: 30,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, ${name.toTitleCase()}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Klik disini untuk melihat akun kamu',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}
