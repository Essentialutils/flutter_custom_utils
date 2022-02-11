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

  bool isDigit() {
    String str = this;
    if (str.isEmpty) {
      return false;
    }
    if (str.length > 1) {
      for (var d in str.runes) {
        if (d ^ 0x30 > 9) {
          return false;
        }
      }
      return true;
    } else {
      return str.runes.first ^ 0x30 <= 9;
    }
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

  bool isDigitOnly() {
    String str = this;
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    return _numeric.hasMatch(str);
  }

  bool isAlphabetOnly() {
    RegExp reg = RegExp(r'^[a-zA-Z]+$');
    return reg.hasMatch(this);
  }

  bool isPhoneIND() {
    String str = this;
    return str.length == 10 && str.isDigit();
  }
}
