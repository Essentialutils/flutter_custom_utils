import 'package:flutter/material.dart';

///
/// add TimeOfDay to DateTime
///
extension DateTimeExtension on DateTime {
  DateTime cApplied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}
