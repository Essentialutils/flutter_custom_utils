extension DoubleExtension on double {
  ///
  /// provide data in meter
  ///
  /// then result will get m or km with extension
  ///
  String get cToDistance => (this >= 1000)
      ? '${(this / 1000).toStringAsFixed(2)} km'
      : '${(this).toStringAsFixed(2)} m';
}

///
/// get discount offer valve based on price and offer price
///
String cGetOffer({
  required double offerPrice,
  required double ordinalPrice,
}) {
  var data = ((ordinalPrice - offerPrice) / ordinalPrice) * 100;
  return (data.toString().contains('.'))
      ? '${(data).toStringAsFixed(2)} %'
      : '$data %';
}
