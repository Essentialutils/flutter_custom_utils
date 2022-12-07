import 'package:flutter/foundation.dart';
import 'dart:io';

///
/// run code on non web platform and also het current platform status
///
bool get cIsAndroid => Platform.isAndroid;
bool get cIsIOS => Platform.isIOS;
bool get cIsLinux => Platform.isLinux;
bool get cIsWindows => Platform.isWindows;
bool get cIsMacOS => Platform.isMacOS;
bool get cIsFuchsia => Platform.isFuchsia;
bool get cIsWeb => kIsWeb;
