///
/// A set of extensions for working with strings
///
extension StringCasingExtension on String {
  String cToCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String cToTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.cToCapitalized())
      .join(' ');

  bool cIsLowerCase() {
    String str = this;
    return str == str.toLowerCase();
  }

  ///
  /// Checks if a string has all capital letters.
  ///
  bool cIsAllCap() {
    return this == (this).toUpperCase();
  }

  String cReverse() {
    return String.fromCharCodes((this).runes.toList().reversed);
  }

  static bool cIsNull(dynamic value) => value == null;

  ///
  /// Checks if string is int or double.
  ///
  bool cIsDigit() {
    if (cIsNull(this)) {
      return false;
    }
    return num.tryParse(this) is num;
  }

  ///
  /// Checks if string is email.
  ///
  bool cIsEmail() {
    var emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailRegex).hasMatch(this);
  }

  bool cIsAlphabetOnly() {
    RegExp reg = RegExp(r'^[a-zA-Z]+$');
    return reg.hasMatch(this);
  }

  bool cIsPhoneIND() {
    String str = this;
    return str.length == 10 && str.cIsDigit();
  }
}
