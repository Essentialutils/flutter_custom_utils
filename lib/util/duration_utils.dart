import 'dart:async';

extension CustonDurationUtils on Duration {
  Future cDelay([FutureOr Function()? callback]) async =>
      Future.delayed(this, callback);
}

extension CustomNumUtils on num {
  /// Utility to delay some callback (or code execution).
  ///
  /// Sample:
  /// ```
  /// void main() {
  ///   0.7.seconds.delay(() {
  /// }
  ///```
  Future cDelay([FutureOr Function()? callback]) async => Future.delayed(
        Duration(milliseconds: (this * 1000).round()),
        callback,
      );

  ///
  /// Easy way to make Durations from numbers.
  ///
  Duration get cMilliseconds => Duration(microseconds: (this * 1000).round());

  Duration get cSeconds => Duration(milliseconds: (this * 1000).round());

  Duration get cMinutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());

  Duration get cHours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());

  Duration get cDays => Duration(hours: (this * Duration.hoursPerDay).round());
}
