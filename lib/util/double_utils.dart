extension DoubleExtension on double {
  ///
  /// provide data in meter
  ///
  /// then result will get m or km with extension
  ///
  String get cToDistance {
    var response = '';
    if (this >= 1000) {
      response = '${(this / 1000).toStringAsFixed(2)} km';
    } else {
      response = '${(this).toStringAsFixed(2)} m';
    }
    return response.replaceAll('.00', '');
  }

  ///
  /// provide data in grams
  ///
  /// then result will get g or kg with extension
  ///
  String get cToWeight {
    var response = '';
    if (this >= 1000) {
      response = '${(this / 1000)} kg';
    } else {
      response = '${(this)} g';
    }
    return response;
  }
}

///
/// get discount offer valve based on price and offer price
///
String cGetOffer({
  required double offerPrice,
  required double ordinalPrice,
  round = false,
  suffix = ' %',
  prefix = '',
}) {
  var data = ((ordinalPrice - offerPrice) / ordinalPrice) * 100;
  if (round) {
    return '$prefix${(data).round()}$suffix';
  }
  return '$prefix${(data).toStringAsFixed(2).replaceAll('.00', '')}$suffix';
}
