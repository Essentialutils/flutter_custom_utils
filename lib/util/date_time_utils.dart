import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Creates a new [DateTime] object with the applied [TimeOfDay] component.
  ///
  /// This method combines the date part of the current [DateTime] instance with
  /// the hour and minute components from the provided [time].
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// final time = TimeOfDay(hour: 15, minute: 30);
  /// final combinedDateTime = date.cApplied(time);
  /// print(combinedDateTime); // Output: 2023-09-13 15:30:00.000
  /// ```
  DateTime cApplied(TimeOfDay time) {
    return DateTime(
      year,
      month,
      day,
      time.hour,
      time.minute,
    );
  }

  /// Converts the [DateTime] instance into a formatted date string.
  ///
  /// Optionally, you can provide a custom [format] string to specify the
  /// desired date format. If [format] is not provided, the default format
  /// 'dd/MM/yyyy' will be used.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// final formattedDate = date.cGetFormattedDate(format: 'MM-dd-yyyy');
  /// print(formattedDate); // Output: 09-13-2023
  /// ```
  String cGetFormattedDate({String? format}) {
    try {
      return DateFormat(format ?? 'dd/MM/yyyy').format(this);
    } catch (e) {
      return (this).toString();
    }
  }

  /// Converts the [DateTime] instance into a human-readable aging string.
  ///
  /// This method calculates the difference between the current [DateTime]
  /// instance and the current date and time and provides an aging description.
  ///
  /// Example:
  /// ```dart
  /// final pastDate = DateTime(2022, 3, 10);
  /// final agingString = pastDate.cDateToAging();
  /// print(agingString); // Output: "1 year ago"
  /// ```
  String cDateToAging() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = difference.inDays ~/ 365;
      return Intl.plural(
        years,
        zero: 'No years ago',
        one: '1 year ago',
        other: '$years years ago',
      );
    } else if (difference.inDays > 30) {
      final months = difference.inDays ~/ 30;
      return Intl.plural(
        months,
        zero: 'No months ago',
        one: '1 month ago',
        other: '$months months ago',
      );
    } else if (difference.inDays > 0) {
      return Intl.plural(
        difference.inDays,
        zero: 'Today',
        one: '1 day ago',
        other: '${difference.inDays} days ago',
      );
    } else if (difference.inHours > 0) {
      return Intl.plural(
        difference.inHours,
        zero: 'Just now',
        one: '1 hour ago',
        other: '${difference.inHours} hours ago',
      );
    } else if (difference.inMinutes > 0) {
      return Intl.plural(
        difference.inMinutes,
        zero: 'Just now',
        one: '1 minute ago',
        other: '${difference.inMinutes} minutes ago',
      );
    } else {
      return 'Just now';
    }
  }
}

extension StringDateExtension on String {
  /// Formats a date string into the specified format.
  ///
  /// [format] (optional): A string representing the desired date format.
  /// If not provided, it defaults to 'dd/MM/yyyy'.
  ///
  /// Returns a formatted date string according to the specified format or the default format if no format is provided.
  ///
  /// Example:
  ///
  /// ```dart
  /// String date = '2023-09-13';
  /// String formattedDate = date.cGetFormattedDate(format: 'MMMM d, y');
  /// // Result: 'September 13, 2023'
  /// ```
  String cGetFormattedDate({String? format}) {
    try {
      final dateTime = DateTime.parse(this);
      return DateFormat(format ?? 'dd/MM/yyyy').format(dateTime);
    } catch (e) {
      return this;
    }
  }

  /// Converts a string representation of a date and time into a [DateTime] object.
  ///
  /// Returns:
  /// - A [DateTime] object if the parsing is successful.
  /// - `null` if the parsing fails or an exception occurs.
  ///
  /// ```Dart
  /// // Example date and time string
  /// String dateString = "2023-09-26 14:30:00";
  /// // Attempt to parse the date string into a DateTime object
  /// DateTime? dateTime = dateString.cGetDateFromString();
  /// // Check if parsing was successful
  /// if (dateTime != null) {
  ///   print("Parsed DateTime: $dateTime");
  /// } else {
  ///   print("Failed to parse the string as DateTime.");
  /// }
  /// ```
  ///
  DateTime? cGetDateFromString() {
    try {
      return DateTime.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// Converts a date string into a human-readable aging format.
  ///
  /// Returns a human-readable aging description of the date string.
  ///
  /// Example:
  ///
  /// ```dart
  /// String date = '2023-08-01T12:34:56';
  /// String agingDescription = date.cDateToAging();
  /// // Result: '1 month ago'
  /// ```
  String cDateToAging() {
    try {
      final now = DateTime.now();
      final difference = now.difference(DateTime.parse(this));

      if (difference.inDays > 365) {
        final years = difference.inDays ~/ 365;
        return Intl.plural(
          years,
          zero: 'No years ago',
          one: '1 year ago',
          other: '$years years ago',
        );
      } else if (difference.inDays > 30) {
        final months = difference.inDays ~/ 30;
        return Intl.plural(
          months,
          zero: 'No months ago',
          one: '1 month ago',
          other: '$months months ago',
        );
      } else if (difference.inDays > 0) {
        return Intl.plural(
          difference.inDays,
          zero: 'Today',
          one: '1 day ago',
          other: '${difference.inDays} days ago',
        );
      } else if (difference.inHours > 0) {
        return Intl.plural(
          difference.inHours,
          zero: 'Just now',
          one: '1 hour ago',
          other: '${difference.inHours} hours ago',
        );
      } else if (difference.inMinutes > 0) {
        return Intl.plural(
          difference.inMinutes,
          zero: 'Just now',
          one: '1 minute ago',
          other: '${difference.inMinutes} minutes ago',
        );
      } else {
        return 'Just now';
      }
    } catch (e) {
      return this;
    }
  }
}
