import 'package:flutter/material.dart';
import '../utils/screen.utils.dart';


class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DeviceType deviceType = ScreenUtils.getDeviceType(size.width);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: size.width * 0.85,
        child: Builder(
          builder: (context) {
            if (deviceType == DeviceType.mobile) {
              return mobile;
            } else if (deviceType == DeviceType.tablet) {
              return tablet ?? mobile;
            } else {
              return desktop;
            }
          },
        ),
      ),
    );
  }
}
