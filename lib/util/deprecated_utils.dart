import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

const _defaultText =
    '. The existing approach is no longer being supported, and all future updates can now be found through the new method.';

@Deprecated('Use cGetResCrossCountGrid()$_defaultText')
int getResCrossCountGrid({
  required BuildContext context,
  required int width,
  bool logData = false,
}) {
  int count = (context.cWidth / width).round();
  if (logData) {
    cLog('GridCount => $count');
  }
  return count;
}

@Deprecated('Use cGetResGridRatio()$_defaultText')
double getResGridRatio({
  required BuildContext context,
  required int height,
  required int width,
  bool logData = false,
}) {
  double w = (context.cWidth / (context.cWidth / width).round());
  double h = (context.cWidth / (context.cWidth / width));
  double asr = w / (h - (width - height));
  if (logData) {
    cLog('GridAspectRatio => $asr');
  }
  return asr;
}

@Deprecated('Use cGetGridRatio()$_defaultText')
double getGridRatio({
  required BuildContext context,
  required int crossAxisCount,
  required int height,
  required int width,
  bool logData = false,
}) {
  double w = (context.cWidth / crossAxisCount);
  double h = (context.cWidth / (context.cWidth / width));
  double asr = w / (h - (width - height));
  if (logData) {
    cLog('GridAspectRatio => $asr');
  }
  return asr;
}
//─────────────────────────────── grid_utils end ───────────────────────────────

@Deprecated('Use cBuildString()$_defaultText')
String buildString(void Function(StringBuffer sb) builderAction) {
  final buffer = StringBuffer();
  builderAction(buffer);
  return buffer.toString();
}

//────────────────────────────── string_utils end ──────────────────────────────
@Deprecated('use cGetDeviceId()$_defaultText')
Future<String> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (cIsIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor ?? 'ios Error';
  } else if (cIsAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  } else if (cIsWindows) {
    var windowsDeviceInfo = await deviceInfo.windowsInfo;
    return windowsDeviceInfo.deviceId;
  } else if (cIsLinux) {
    var linuxDeviceInfo = await deviceInfo.linuxInfo;
    return linuxDeviceInfo.id;
  } else if (cIsWeb) {
    var webDeviceInfo = await deviceInfo.webBrowserInfo;
    return "${webDeviceInfo.vendor ?? ' <=> '} : ${webDeviceInfo.userAgent ?? ' <=> '} : ${webDeviceInfo.hardwareConcurrency ?? ' <=> '}";
  } else if (cIsMacOS) {
    var macDeviceInfo = await deviceInfo.macOsInfo;
    return macDeviceInfo.systemGUID ?? 'mac os error';
  } else {
    return 'Unfortunately, the current platform is not compatible.';
  }
}

//───────────────────────────────── utils end ──────────────────────────────────
extension CHColor on Color {
  @Deprecated('use cToColor() extension$_defaultText')
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @Deprecated('use cToHex() extension$_defaultText')
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
