import 'dart:math';

extension ListExtension on List {
  ///
  /// select random item from list
  ///
  Object get cRandomSelect => this[Random().nextInt((this).length)];
}

extension MyIterable<T> on Iterable<T> {
  ///
  /// get first item if list not empty
  /// if the list is empty then result will null
  ///
  T? get cFirst => isEmpty ? null : first;

  ///
  /// get first item based on condition
  /// if list if empty then result will be null
  ///
  T? cFirstWhere(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}
