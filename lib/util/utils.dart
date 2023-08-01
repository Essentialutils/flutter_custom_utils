import 'dart:developer';
import 'dart:typed_data';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:flutter_custom_utils/flutter_custom_utils.dart';

///
/// log data in green color in vs code only
///
void cLog(
  String body, {
  String n = 'repad.dev',
}) {
  log('\x1B[32m $body \x1B[0m', name: n);
}

///
/// get device id in all platform
///
Future<String> cGetDeviceId() async {
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
    return 'Platform currently not supported';
  }
}

Future<Uint8List> cTakePicture(GlobalKey<State<StatefulWidget>> key) async {
  RenderRepaintBoundary boundary =
      key.currentContext?.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();
  return pngBytes;
}
