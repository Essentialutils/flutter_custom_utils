import 'dart:math';

extension ListExtention on List {
  ///
  /// select random item from list
  ///
  Object get cRandomSelect => this[Random().nextInt((this).length)];
}
