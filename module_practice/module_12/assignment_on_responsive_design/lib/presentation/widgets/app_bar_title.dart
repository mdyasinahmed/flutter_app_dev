import 'package:flutter/material.dart';
import '../utils/screen.utils.dart';


class AppBarTitle extends StatelessWidget {
  final String title;

  const AppBarTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    DeviceType deviceType = ScreenUtils.getDeviceType(screenWidth);

    TextAlign textAlign;
    if (deviceType == DeviceType.mobile) {
      textAlign = TextAlign.right;
    } else {
      textAlign = TextAlign.left;
    }

    return Text(
      title,
      textAlign: textAlign,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
