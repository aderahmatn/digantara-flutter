import 'package:digantara/utils/constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SpinKitFadingCircle(
      color: dPrimaryColor,
      size: 60,
    ));
  }
}
