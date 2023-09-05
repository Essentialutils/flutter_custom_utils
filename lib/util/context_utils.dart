import 'package:flutter/material.dart';

/// An extension for the `BuildContext` class providing convenient access to common MediaQuery properties and theme information.
extension ContextExt on BuildContext {
  /// Returns the size of the screen obtained from [MediaQuery.of(context).size].
  Size get cSize => MediaQuery.of(this).size;

  /// Returns the `MediaQueryData` object obtained from [MediaQuery.of(context)].
  MediaQueryData get cMQuery => MediaQuery.of(this);

  /// Returns the height of the screen obtained from [MediaQuery.of(context).size.height].
  double get cHeight => MediaQuery.of(this).size.height;

  /// Returns the width of the screen obtained from [MediaQuery.of(context).size.width].
  double get cWidth => MediaQuery.of(this).size.width;

  /// Returns the current theme data obtained from [Theme.of(context)].
  ThemeData get cTheme => Theme.of(this);

  /// Checks if the dark mode theme is enabled by comparing the brightness from [Theme.of(context)].
  bool get cIsDarkMode => (Theme.of(this).brightness == Brightness.dark);

  /// Returns the icon color from the current theme obtained from [Theme.of(context).iconTheme.color].
  Color? get cIconColor => Theme.of(this).iconTheme.color;

  /// Returns the text theme from the current theme obtained from [Theme.of(context).textTheme].
  TextTheme get cTextTheme => Theme.of(this).textTheme;

  /// Returns the orientation of the device screen obtained from [MediaQuery.of(context).orientation].
  Orientation get cOrient => MediaQuery.of(this).orientation;

  /// Checks if the device screen is in landscape mode by comparing the orientation from [MediaQuery.of(context)].
  bool get cIsLand => MediaQuery.of(this).orientation == Orientation.landscape;

  /// Checks if the device screen is in portrait mode by comparing the orientation from [MediaQuery.of(context)].
  bool get cIsPort => MediaQuery.of(this).orientation == Orientation.portrait;

  /// Returns the device pixel ratio obtained from [MediaQuery.of(this).devicePixelRatio].
  double get cDevicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Returns `true` if the device is identified as a tablet based on its screen size.
  bool get cIsTablet => MediaQuery.of(this).size.shortestSide > 600;
}

/// Get the size of the screen from a given [BuildContext].
Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// Get the `MediaQueryData` object from a given [BuildContext].
MediaQueryData mQuery(BuildContext context) {
  return MediaQuery.of(context);
}
