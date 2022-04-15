import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  final String image;
  const TopBanner(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 145,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage('${imageBannerUrl}${image}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
