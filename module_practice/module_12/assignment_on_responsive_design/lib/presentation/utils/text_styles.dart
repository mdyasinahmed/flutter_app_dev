import 'package:flutter/material.dart';
import 'screen.utils.dart';


class TextStyles {
  static TextStyle getHeadline(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    DeviceType deviceType = ScreenUtils.getDeviceType(screenWidth);

    if (deviceType == DeviceType.mobile) {
      return const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    } else if (deviceType == DeviceType.tablet) {
      return const TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
    } else {
      return const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
    }
  }

  static TextStyle getParagraph(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    DeviceType deviceType = ScreenUtils.getDeviceType(screenWidth);

    if (deviceType == DeviceType.mobile) {
      return const TextStyle(fontSize: 14);
    } else if (deviceType == DeviceType.tablet) {
      return const TextStyle(fontSize: 16);
    } else {
      return const TextStyle(fontSize: 18);
    }
  }
}
