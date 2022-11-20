import 'package:flutter/foundation.dart';
import 'dart:io';

bool get cIsAndroid => (kIsWeb ? false : Platform.isAndroid);
bool get cIsIOS => (kIsWeb ? false : Platform.isIOS);
bool get cIsLinux => (kIsWeb ? false : Platform.isLinux);
bool get cIsWindows => (kIsWeb ? false : Platform.isWindows);
bool get cIsMacOS => (kIsWeb ? false : Platform.isMacOS);
bool get cIsFuchsia => (kIsWeb ? false : Platform.isFuchsia);
bool get cIsWeb => kIsWeb;
