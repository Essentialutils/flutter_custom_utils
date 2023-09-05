import 'package:flutter/material.dart';

/// An extension on the [DateTime] class that provides a method to combine
/// a [TimeOfDay] instance with a [DateTime] to create a new [DateTime] instance.
extension DateTimeExtension on DateTime {
  /// Combines the current date from the [DateTime] instance with the provided
  /// [TimeOfDay] to create a new [DateTime] instance with the same date and
  /// the specified time.
  ///
  /// Example:
  ///
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// TimeOfDay time = TimeOfDay(hour: 14, minute: 30);
  /// DateTime combinedDateTime = currentDate.cApplied(time);
  /// ```
  ///
  /// In this example, `combinedDateTime` will represent today's date at 14:30.
  ///
  /// Throws an error if the provided [TimeOfDay] is `null`.
  DateTime cApplied(TimeOfDay time) {
    return DateTime(
      year,
      month,
      day,
      time.hour,
      time.minute,
    );
  }
}
