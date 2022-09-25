import 'dart:io';
import 'package:flutter/foundation.dart';

bool cIsAndroid() {
  return Platform.isAndroid;
}

bool cIsIOS() {
  return Platform.isIOS;
}

bool cIsLinux() {
  return Platform.isLinux;
}

bool cIsWindows() {
  return Platform.isWindows;
}

bool cIsMacOS() {
  return Platform.isMacOS;
}

bool cIsFuchsia() {
  return Platform.isFuchsia;
}

bool cIsWeb() {
  return kIsWeb;
}
