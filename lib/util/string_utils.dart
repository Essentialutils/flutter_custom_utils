import 'package:intl/intl.dart';

///
/// A set of extensions for working with strings.
///
extension StringCasingExtension on String {
  ///
  /// Converts the first character of the string to uppercase and the rest to lowercase.
  ///
  String get cToCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  ///
  /// Converts each word in the string to title case.
  ///
  String get cToTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.cToCapitalized)
      .join(' ');

  ///
  /// Checks if the string is in all lowercase.
  ///
  bool get cIsLowerCase {
    return this == (this).toLowerCase();
  }

  ///
  /// Checks if the string is in all uppercase.
  ///
  bool get cIsAllCap {
    return this == (this).toUpperCase();
  }

  ///
  /// Reverses the characters in the string.
  ///
  String get cReverse {
    return String.fromCharCodes((this).runes.toList().reversed);
  }

  ///
  /// Checks if a dynamic value is null.
  ///
  static bool cIsNull(dynamic value) => value == null;

  ///
  /// Checks if the string represents an integer or a double.
  ///
  bool get cIsDigit {
    if (cIsNull(this)) {
      return false;
    }
    return num.tryParse(this) is num;
  }

  ///
  /// Checks if the string is a valid email address.
  ///
  bool get cIsEmail {
    var emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailRegex).hasMatch(this);
  }

  ///
  /// Checks if the string contains only alphabet characters.
  ///
  bool get cIsAlphabetOnly {
    RegExp reg = RegExp(r'^[a-zA-Z]+$');
    return reg.hasMatch(this);
  }

  ///
  /// Checks if the string is a 10-digit Indian phone number.
  ///
  bool get cIsPhoneIND {
    return (this).length == 10 && (this).cIsDigit;
  }

  ///
  /// Converts certain string values ('true', 'false', '1', '0') to a boolean.
  ///
  bool get cToBoolean {
    if ((this).toLowerCase() == 'true' || (this).toLowerCase() == '1') {
      return true;
    }
    if ((this).toLowerCase() == 'false' || (this).toLowerCase() == '0') {
      return false;
    }
    throw ('cToBoolean value is : $this');
  }

  ///
  /// Checks if the string is a valid URL.
  ///
  bool get cIsURL {
    var reg = RegExp(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
    );
    return reg.hasMatch(this);
  }

  ///
  /// Checks if the string is a valid phone number.
  ///
  bool get cIsPhoneNumber {
    var reg = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if ((this).length > 16 || (this).length < 9) return false;
    return reg.hasMatch(this);
  }

  ///
  /// Converts a number string to Indian currency format.
  ///
  String get cToCurrencyIND {
    return NumberFormat.currency(
      symbol: '₹ ',
      locale: 'HI',
      decimalDigits: 2,
    ).format(double.parse(this));
  }

  ///
  /// Converts a number string to a custom currency format.
  ///
  String cToCurrency({
    removePointValueIfEmpty = true,
    symbol = '₹ ',
    currencyFormat = 'HI',
    decimalDigits = 2,
  }) {
    var emptyPoint = '.' +
        cBuildString(
          (sb) {
            for (var i = 0; i < decimalDigits; i++) {
              sb.write('0');
            }
          },
        );
    var value = NumberFormat.currency(
      symbol: symbol,
      locale: currencyFormat,
      decimalDigits: decimalDigits,
    ).format(double.parse(this));
    return (removePointValueIfEmpty) ? value.replaceAll(emptyPoint, '') : value;
  }
}

///
/// Converts a map to a URL-encoded string.
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

///
/// Builds a new string by populating a newly created [StringBuffer] using the provided [builderAction]
/// and then converting it to [String].
///
String cBuildString(void Function(StringBuffer sb) builderAction) {
  final buffer = StringBuffer();
  builderAction(buffer);
  return buffer.toString();
}
