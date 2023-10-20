import 'package:flutter/widgets.dart';

/// Extension on the `Color` class to convert a Color object to its hexadecimal representation.
extension ColorExtension on Color {
  /// Converts the Color object to its hexadecimal representation.
  ///
  /// Returns a hexadecimal string representation of the color, including the alpha channel.
  ///
  /// ```dart
  ///   Color color = Colors.blue;
  ///   String hex = color.cToHex();
  ///   print('Hexadecimal representation of $color: $hex');
  /// ```
  String cToHex() =>
      '#${(this).value.toRadixString(16).padLeft(8, '0').substring(2)}';
}

/// Extension on the `String` class to convert a hexadecimal color representation to a Color object.
extension ColorCodeExtension on String {
  /// Converts a hexadecimal color representation to a Color object.
  ///
  /// The input string should be a valid hexadecimal color code starting with '#' (e.g., '#RRGGBB').
  ///
  /// Returns a Color object corresponding to the input hexadecimal representation.
  ///
  /// ```dart
  ///   String hexCode = '#FF5722'; // Example hex code
  ///   Color convertedColor = hexCode.cToColor();
  ///   print('Color representation of $hexCode: $convertedColor');
  /// ```
  Color cToColor() {
    return Color(int.parse((this).substring(1, 7), radix: 16) + 0xFF000000);
  }
}
