import 'package:flutter/widgets.dart';

/// An extension for the `Color` class to provide additional functionality for working with hexadecimal color representations.
extension CHColor on Color {
  /// Creates a `Color` object from a hexadecimal color string.
  ///
  /// The [hexString] parameter should be a valid hexadecimal color representation.
  /// If the string does not include the '#' sign, it will be added automatically.
  /// If the string has only 6 characters, it's assumed to represent RGB values,
  /// and an alpha value of 255 (fully opaque) will be added.
  ///
  /// Example usage:
  /// ```dart
  /// final color = Color.fromHex('#FFA500'); // Creates an orange Color object.
  /// ```
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Converts a `Color` object to its hexadecimal representation.
  ///
  /// The [leadingHashSign] parameter determines whether to include the '#' sign in the output.
  ///
  /// Example usage:
  /// ```dart
  /// final color = Color(0xFFFFA500); // Creates an orange Color object.
  /// final hex = color.toHex(); // Returns '#FFA500'.
  /// ```
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
