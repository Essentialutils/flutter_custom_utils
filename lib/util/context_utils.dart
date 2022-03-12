import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ///
  /// The same of [MediaQuery.of(context).size]
  ///
  Size get cSize => MediaQuery.of(this).size;

  ///
  /// The same of [MediaQuery.of(context)]
  ///
  MediaQueryData get cMQuery => MediaQuery.of(this);

  ///
  /// The same of [MediaQuery.of(context).size.height]
  ///

  double get cHeight => MediaQuery.of(this).size.height;

  ///
  /// The same of [MediaQuery.of(context).size.width]
  ///

  double get cWidth => MediaQuery.of(this).size.width;

  ///
  /// similar to [MediaQuery.of(context).padding]
  ///
  ThemeData get cTheme => Theme.of(this);

  ///
  /// Check if dark mode theme is enable
  ///
  bool get cIsDarkMode => (Theme.of(this).brightness == Brightness.dark);

  ///
  /// give access to Theme.of(context).iconTheme.color
  ///
  Color? get cIconColor => Theme.of(this).iconTheme.color;

  ///
  /// similar to [MediaQuery.of(context).padding]
  ///
  TextTheme get cTextTheme => Theme.of(this).textTheme;

  ///
  /// similar to [MediaQuery.of(context).orientation]
  ///
  Orientation get cOrient => MediaQuery.of(this).orientation;

  ///
  /// check if device is on landscape mode
  ///
  bool get cIsLand => MediaQuery.of(this).orientation == Orientation.landscape;

  ///
  /// check if device is on portrait mode
  ///
  bool get cIsPort => MediaQuery.of(this).orientation == Orientation.portrait;

  ///
  /// similar to [MediaQuery.of(this).devicePixelRatio]
  ///
  double get cDevicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  // Return true if the device is a tablet
  bool get cIsTablet => MediaQuery.of(this).size.shortestSide > 600;
}

///
/// get MediaQuery size
///
Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

///
/// get MediaQuery size
///
MediaQueryData mQuery(BuildContext context) {
  return MediaQuery.of(context);
}
