import 'dart:async';

/// An extension for the `Duration` class providing utilities for delaying code execution.
extension CustomDurationUtils on Duration {
  /// Delays the execution of a callback or code by the specified duration.
  ///
  /// Usage:
  /// ```dart
  /// void main() {
  ///   const delayDuration = Duration(seconds: 2);
  ///   delayDuration.cDelay(() {
  ///     // Code to be executed after a 2-second delay.
  ///   });
  /// }
  /// ```
  Future cDelay([FutureOr Function()? callback]) async =>
      Future.delayed(this, callback);
}

/// An extension for the `num` class providing utilities for dealing with time durations and delaying code execution.
extension CustomNumUtils on num {
  /// Delays the execution of a callback or code by the specified number of seconds.
  ///
  /// Usage:
  /// ```dart
  /// void main() {
  ///   2.delay(() {
  ///     // Code to be executed after a 2-second delay.
  ///   });
  /// }
  /// ```
  Future cDelay([FutureOr Function()? callback]) async => Future.delayed(
        Duration(
          milliseconds: (this * 1000).round(),
        ),
        callback,
      );

  /// Converts a numeric value to a `Duration` representing milliseconds.
  ///
  /// Usage:
  /// ```dart
  /// final millisecondsDuration = 500.cMilliseconds;
  /// ```
  Duration get cMilliseconds => Duration(
        microseconds: (this * 1000).round(),
      );

  /// Converts a numeric value to a `Duration` representing seconds.
  ///
  /// Usage:
  /// ```dart
  /// final secondsDuration = 5.cSeconds;
  /// ```
  Duration get cSeconds => Duration(
        milliseconds: (this * 1000).round(),
      );

  /// Converts a numeric value to a `Duration` representing minutes.
  ///
  /// Usage:
  /// ```dart
  /// final minutesDuration = 10.cMinutes;
  /// ```
  Duration get cMinutes => Duration(
        seconds: (this * Duration.secondsPerMinute).round(),
      );

  /// Converts a numeric value to a `Duration` representing hours.
  ///
  /// Usage:
  /// ```dart
  /// final hoursDuration = 2.cHours;
  /// ```
  Duration get cHours => Duration(
        minutes: (this * Duration.minutesPerHour).round(),
      );

  /// Converts a numeric value to a `Duration` representing days.
  ///
  /// Usage:
  /// ```dart
  /// final daysDuration = 3.cDays;
  /// ```
  Duration get cDays => Duration(
        hours: (this * Duration.hoursPerDay).round(),
      );
}
