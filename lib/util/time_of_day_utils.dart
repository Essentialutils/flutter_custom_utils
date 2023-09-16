import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NullableTimeOfDayExtension on TimeOfDay? {
  /// An extension for nullable [TimeOfDay] objects, providing a method to
  /// convert them to a formatted string in AM/PM format or display 'Invalid date'
  /// if the [TimeOfDay] object is null.
  ///
  /// This extension is useful for converting a nullable [TimeOfDay] object
  /// to a user-friendly string representation.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// TimeOfDay? timeOfDay = TimeOfDay(hour: 14, minute: 30);
  /// String formattedTime = timeOfDay.cTimeOfDayToString();
  /// print(formattedTime); // Output: "2:30 PM"
  ///
  /// timeOfDay = null;
  /// formattedTime = timeOfDay.cTimeOfDayToString();
  /// print(formattedTime); // Output: "Invalid date"
  /// ```
  String cTimeOfDayToString() {
    if (this != null) {
      final now = DateTime.now();
      final dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        this!.hour,
        this!.minute,
      );
      final formatter =
          DateFormat.jm(); // This will format it into AM/PM format
      return formatter.format(dateTime);
    } else {
      return 'Invalid date';
    }
  }
}

extension StringTimeParsing on String {
  /// Parses the string into a [TimeOfDay] object.
  ///
  /// This method attempts to parse the input string in both 12-hour and 24-hour
  /// time formats and returns a [TimeOfDay] object if parsing is successful,
  /// or null if the string cannot be parsed as a valid time.
  ///
  /// If the input string cannot be parsed in either format, it returns null.
  ///
  /// Example:
  ///
  /// ```dart
  /// String timeString = "2:30 PM";
  /// TimeOfDay? timeOfDay = timeString.cToTimeOfDay();
  ///
  /// if (timeOfDay != null) {
  ///   print("Parsed time: $timeOfDay");
  /// } else {
  ///   print("Invalid time format");
  /// }
  /// ```
  TimeOfDay? cToTimeOfDay() {
    try {
      // Attempt to parse the time using 12-hour format
      final dateTime12Hour = DateFormat('h:mm a').parse((this).toUpperCase());
      return TimeOfDay.fromDateTime(dateTime12Hour);
    } catch (_) {
      try {
        // Attempt to parse the time using 24-hour format
        final dateTime24Hour = DateFormat('H:mm').parse(this);
        return TimeOfDay.fromDateTime(dateTime24Hour);
      } catch (_) {
        return null;
      }
    }
  }
}
