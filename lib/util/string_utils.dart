///
/// A set of extensions for working with strings
///
extension StringCasingExtension on String {
  String get cToCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get cToTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.cToCapitalized)
      .join(' ');

  bool get cIsLowerCase {
    String str = this;
    return str == str.toLowerCase();
  }

  ///
  /// Checks if a string has all capital letters.
  ///
  bool get cIsAllCap {
    return this == (this).toUpperCase();
  }

  String get cReverse {
    return String.fromCharCodes((this).runes.toList().reversed);
  }

  static bool cIsNull(dynamic value) => value == null;

  ///
  /// Checks if string is int or double.
  ///
  bool get cIsDigit {
    if (cIsNull(this)) {
      return false;
    }
    return num.tryParse(this) is num;
  }

  ///
  /// Checks if string is email.
  ///
  bool get cIsEmail {
    var emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailRegex).hasMatch(this);
  }

  bool get cIsAlphabetOnly {
    RegExp reg = RegExp(r'^[a-zA-Z]+$');
    return reg.hasMatch(this);
  }

  bool get cIsPhoneIND {
    String str = this;
    return str.length == 10 && str.cIsDigit;
  }

  bool get cToBoolean {
    String str = this;
    if (str.toLowerCase() == 'true' || str.toLowerCase() == '1') {
      return true;
    }
    if (str.toLowerCase() == 'false' || str.toLowerCase() == '0') {
      return false;
    }
    throw ('value : str');
  }

  ///
  /// Check if siring is a valid url
  ///
  bool get cIsURL {
    var reg = RegExp(
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");
    return reg.hasMatch(this);
  }

  ///
  /// Check if siring is a Phone Number
  ///
  bool get cIsPhoneNumber {
    var s = this;
    var reg = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if (s.length > 16 || s.length < 9) return false;
    return reg.hasMatch(s);
  }
}

///
/// build for map to fourl encoded
///
/// Content-Type: 'application/x-www-form-urlencoded'
///

String cFormUrlEncode(Map<String, String> data) {
  var st = '';
  data.forEach((key, value) {
    st += (st != '') ? '&$key=$value' : '$key=$value';
    return;
  });
  return st;
}
