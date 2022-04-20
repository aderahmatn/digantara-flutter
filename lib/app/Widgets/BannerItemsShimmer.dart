import 'package:digantara/app/Widgets/ShimmerWidget.dart';
import 'package:flutter/material.dart';

class BannerItemShimmer extends StatelessWidget {
  const BannerItemShimmer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15),
        height: size.height * 0.20,
        child: Container(
          margin: EdgeInsets.only(left: 15),
          height: 145,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: ShimmerWidget.rectangular(height: 145),
        ));
  }
}
