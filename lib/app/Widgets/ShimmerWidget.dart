import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerWidget.rectangular(
      {this.width = double.infinity, required this.height});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
      );
}
