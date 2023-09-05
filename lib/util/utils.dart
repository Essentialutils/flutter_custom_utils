import 'dart:developer';
import 'dart:typed_data';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:flutter_custom_utils/flutter_custom_utils.dart';

///
/// Logs data in green color in Visual Studio Code (VS Code) console.
///
/// Usage:
/// ```dart
/// cLog("This is a green log message");
/// ```
///
void cLog(
  String body, {
  String n = 'repad.dev',
}) {
  log('\x1B[32m $body \x1B[0m', name: n);
}

///
/// Retrieves the device ID for various platforms, including iOS, Android, Windows, Linux, Web, and macOS.
///
/// Usage:
/// ```dart
/// String deviceId = await cGetDeviceId();
/// print("Device ID: $deviceId");
/// ```
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

///
/// Takes a screenshot of a widget using a [GlobalKey] and returns it as a [Uint8List] (PNG image).
///
/// Usage:
/// ```dart
/// final GlobalKey<State<StatefulWidget>> key = GlobalKey();
/// // ...
/// Uint8List screenshot = await cTakePicture(key);
/// ```
///
Future<Uint8List> cTakePicture(GlobalKey<State<StatefulWidget>> key) async {
  RenderRepaintBoundary boundary =
      key.currentContext?.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();
  return pngBytes;
}
