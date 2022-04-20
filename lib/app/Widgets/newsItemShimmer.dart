import 'package:digantara/utils/constant.dart';
import 'package:flutter/material.dart';

import 'ShimmerWidget.dart';

class newsItemShimmer extends StatelessWidget {
  const newsItemShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dDefaultPadding, vertical: 7),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 90,
            width: 100,
            child: ShimmerWidget.rectangular(height: 90),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(
                  height: 10,
                  width: 70,
                ),
                SizedBox(height: 5),
                ShimmerWidget.rectangular(height: 30),
                SizedBox(height: 5),
                ShimmerWidget.rectangular(height: 15, width: 100),
                SizedBox(height: 5),
                ShimmerWidget.rectangular(height: 10, width: 150),
              ],
            ),
          )
        ],
      ),
    );
  }
}
