///
/// Tools for working with strings
///
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  bool isLowerCase() {
    String str = this;
    return str == str.toLowerCase();
  }

  bool isUpperCase() {
    String str = this;
    return str == str.toUpperCase();
  }

  String reverse() {
    String str = this;
    return String.fromCharCodes(str.runes.toList().reversed);
  }

  static bool isNull(dynamic value) => value == null;

  ///
  /// Check if it is a numeric value
  ///
  bool isNum() {
    if (isNull(this)) {
      return false;
    }
    return num.tryParse(this) is num;
  }

  bool isPalindrome() {
    String str = this;
    for (var i = 0; i < str.length / 2; i++) {
      if (str[i] != str[str.length - 1 - i]) return false;
    }
    return true;
  }

  bool isEmail() {
    String str = this;
    var emailRegex =
        '^([\\w\\d\\-\\+]+)(\\.+[\\w\\d\\-\\+%]+)*@([\\w\\-]+\\.){1,5}(([A-Za-z]){2,30}|xn--[A-Za-z0-9]{1,26})\$';
    var regExp = RegExp(emailRegex);
    return regExp.hasMatch(str);
  }

  bool isAlphabetOnly() {
    RegExp reg = RegExp(r'^[a-zA-Z]+$');
    return reg.hasMatch(this);
  }

  bool isPhoneIND() {
    String str = this;
    return str.length == 10 && str.isNum();
  }
}
