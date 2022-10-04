import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:platform_device_id/platform_device_id.dart';

///
/// log datas in green color in vs code only
///
void cLog(
  String body, {
  String n = 'oms',
}) {
  log('\x1B[32m$body\x1B[0m', name: n);
}

///
/// get device id in all platform
///
Future<String?> get getDeviceId async => await PlatformDeviceId.getDeviceId;

Future<Uint8List> cTakePicture(GlobalKey<State<StatefulWidget>> key) async {
  RenderRepaintBoundary boundary =
      key.currentContext?.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();
  return pngBytes;
}
