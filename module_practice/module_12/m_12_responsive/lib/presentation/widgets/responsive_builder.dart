import 'package:flutter/material.dart';
import 'package:m_12_responsive/presentation/utils/screen_utils.dart';

class ResponsiveBuilder extends StatefulWidget {
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
  State<StatefulWidget> createState() => _ResponsiveBuilderState();
}

class _ResponsiveBuilderState extends State<ResponsiveBuilder> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DeviceType deviceType = ScreenUtils.getDeviceType(size.width);

    if (deviceType == DeviceType.mobile) {
      return widget.mobile;
    } else if (deviceType == DeviceType.tablet) {
      return widget.tablet ?? widget.mobile;
    }
    return widget.desktop;
  }
}
