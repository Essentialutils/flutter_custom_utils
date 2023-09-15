import 'package:flutter/widgets.dart';

extension ColorExtension on Color {
  /// This extension provides a method to convert a Flutter `Color` object
  /// to its hexadecimal representation with an optional leading hash sign.
  /// The resulting hexadecimal string includes the alpha, red, green, and blue
  /// components of the color.
  ///
  /// Usage:
  /// ```dart
  /// final color = Color(0xFF42A5F5);
  /// final hexString = color.cToHex(); // Returns: "#FF42A5F5"
  /// ```
  ///
  /// Parameters:
  /// - [leadingHashSign]: A boolean value indicating whether to include a
  ///   leading hash sign '#' in the hexadecimal representation. By default,
  ///   it includes the hash sign.
  ///
  /// Example:
  /// ```dart
  /// final color = Color(0xFF42A5F5);
  ///
  /// // Without leading hash sign
  /// final hexStringWithoutHash = color.cToHex(leadingHashSign: false);
  /// // Returns: "FF42A5F5"
  ///
  /// // With leading hash sign
  /// final hexStringWithHash = color.cToHex();
  /// // Returns: "#FF42A5F5"
  /// ```
  String cToHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ColorCodeExtension on String {
  /// This extension provides a method to convert a hexadecimal color code
  /// represented as a String into a Flutter `Color` object. The color code can
  /// optionally include a leading hash sign ('#'). If the input color code
  /// has 6 or 7 characters (with or without the hash sign), the method will
  /// assume it represents a color with an alpha component and append 'ff' to
  /// the color code to make it fully opaque.
  ///
  /// Usage:
  /// ```dart
  /// final colorCode = '#FF42A5F5';
  /// final color = colorCode.cToColor(); // Returns: Color(0xFF42A5F5)
  /// ```
  ///
  /// Example:
  /// ```dart
  /// final colorCodeWithHash = '#FF42A5F5';
  /// final colorWithHash = colorCodeWithHash.cToColor();
  /// // Returns: Color(0xFF42A5F5)
  ///
  /// final colorCodeWithoutHash = 'FF42A5F5';
  /// final colorWithoutHash = colorCodeWithoutHash.cToColor();
  /// // Returns: Color(0xFF42A5F5)
  /// ```
  Color cToColor() {
    final buffer = StringBuffer();

    /// Check if the color code has 6 or 7 characters.
    if ((this).length == 6 || (this).length == 7) {
      buffer.write('ff');
    }

    /// Remove any leading hash sign ('#') and append the remaining code.
    buffer.write((this).replaceFirst('#', ''));

    /// Parse the hexadecimal color code and return a Color object.
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
