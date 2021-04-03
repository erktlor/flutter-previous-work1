import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

bool isMobile(BuildContext context) {
  var deviceType = getDeviceType(MediaQuery.of(context).size);

  return deviceType != DeviceScreenType.desktop;
}
