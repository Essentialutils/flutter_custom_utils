/// An extension for the `double` class providing convenient methods for formatting distances and weights.
extension DoubleExtension on double {
  /// Converts a numeric value in meters to a human-readable distance representation with the appropriate unit (meters or kilometers).
  ///
  /// Returns a formatted string representing the distance, e.g., "5.75 m" or "2.34 km".
  String get cToDistance {
    var distance = '';
    if (this >= 1000) {
      distance = '${(this / 1000).toStringAsFixed(2)} km';
    } else {
      distance = '${(this).toStringAsFixed(2)} m';
    }
    return distance.replaceAll('.00', '');
  }

  /// Converts a numeric value in grams to a human-readable weight representation with the appropriate unit (grams or kilograms).
  ///
  /// Returns a formatted string representing the weight, e.g., "750 g" or "1.25 kg".
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

/// Calculates the discount percentage based on the original price and the offer price.
///
/// Returns a formatted string representing the discount percentage with optional prefix and suffix.
///
/// - `offerPrice`: The price after the discount.
/// - `ordinalPrice`: The original price before the discount.
/// - `round`: If `true`, the result is rounded to the nearest integer.
/// - `suffix`: An optional suffix to append to the result (e.g., " %").
/// - `prefix`: An optional prefix to prepend to the result.
///
/// Example usage:
/// ```dart
/// final discount = cGetOffer(offerPrice: 45.0, ordinalPrice: 60.0, round: true); // Returns "25 %"
/// ```
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
