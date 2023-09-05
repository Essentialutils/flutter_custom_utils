import 'dart:math';

/// An extension on the `List` class to provide additional functionality.
extension ListExtension on List {
  ///
  /// Select a random item from the list.
  ///
  /// Returns a random item from the list using the [Random] class.
  Object get cRandomSelect => this[Random().nextInt((this).length)];
}

/// An extension on the `Iterable` class to provide additional functionality.
extension MyIterable<T> on Iterable<T> {
  ///
  /// Get the first item from the iterable if it's not empty.
  ///
  /// If the iterable is empty, this method returns null.
  ///
  T? get cFirst => isEmpty ? null : first;

  ///
  /// Get the first item from the iterable that satisfies a condition.
  ///
  /// If the iterable is empty or no element satisfies the condition, this
  /// method returns null.
  ///
  /// Parameters:
  /// - `test`: A function that takes an element of the iterable and returns
  ///   `true` if the element satisfies the condition.
  ///
  T? cFirstWhere(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}
