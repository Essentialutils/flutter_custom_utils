import 'package:flutter/widgets.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

/// Calculate the responsive `crossAxisCount` for a GridView based on item width.
///
/// This function calculates the number of items that can fit in the cross-axis
/// of a GridView based on the provided `width`. It takes into account the
/// available screen width (context.cWidth) and an optional `discardSize` that
/// can be used to exclude additional space.
///
/// Parameters:
/// - `context`: The [BuildContext] used to access the screen width.
/// - `width`: The width of each grid item.
/// - `logData`: (Optional) Set to `true` to log the calculated count.
/// - `discardSize`: (Optional) An additional size to be excluded from the width calculation.
///
/// Returns the calculated `crossAxisCount` as an integer.
int cGetResCrossCountGrid({
  required BuildContext context,
  required int width,
  bool logData = false,
  double? discardSize,
}) {
  double primaryWidth = ((context.cWidth) - (discardSize ?? 0.0));
  int count = (primaryWidth / width).round();
  if (logData) {
    cLog('GridCount => $count');
  }
  return count;
}

/// Calculate the responsive `childAspectRatio` for a GridView based on item dimensions.
///
/// This function calculates the childAspectRatio for a GridView based on the
/// provided `height` and `width` of the grid items. It takes into account the
/// available screen width (context.cWidth) and an optional `discardSize` that
/// can be used to exclude additional space.
///
/// Parameters:
/// - `context`: The [BuildContext] used to access the screen width.
/// - `height`: The height of each grid item.
/// - `width`: The width of each grid item.
/// - `logData`: (Optional) Set to `true` to log the calculated aspect ratio.
/// - `discardSize`: (Optional) An additional size to be excluded from the width calculation.
///
/// Returns the calculated `childAspectRatio` as a double.
double cGetResGridRatio({
  required BuildContext context,
  required int height,
  required int width,
  bool logData = false,
  double? discardSize,
}) {
  double primaryWidth = ((context.cWidth) - (discardSize ?? 0.0));
  double w = (primaryWidth / (primaryWidth / width).round());
  double h = (primaryWidth / (primaryWidth / width));
  double asr = w / (h - (width - height));
  if (logData) {
    cLog('GridAspectRatio => $asr');
  }
  return asr;
}

/// Calculate the `childAspectRatio` for a GridView based on item dimensions and `crossAxisCount`.
///
/// This function calculates the childAspectRatio for a GridView based on the
/// provided `height`, `width`, and `crossAxisCount` of the grid items. It takes
/// into account the available screen width (context.cWidth) and an optional
/// `discardSize` that can be used to exclude additional space.
///
/// Parameters:
/// - `context`: The [BuildContext] used to access the screen width.
/// - `crossAxisCount`: The number of items in the cross-axis of the GridView.
/// - `height`: The height of each grid item.
/// - `width`: The width of each grid item.
/// - `logData`: (Optional) Set to `true` to log the calculated aspect ratio.
/// - `discardSize`: (Optional) An additional size to be excluded from the width calculation.
///
/// Returns the calculated `childAspectRatio` as a double.
double cGetGridRatio({
  required BuildContext context,
  required int crossAxisCount,
  required int height,
  required int width,
  bool logData = false,
  double? discardSize,
}) {
  double primaryWidth = ((context.cWidth) - (discardSize ?? 0.0));
  double w = (primaryWidth / crossAxisCount);
  double h = (primaryWidth / (primaryWidth / width));
  double asr = w / (h - (width - height));
  if (logData) {
    cLog('GridAspectRatio => $asr');
  }
  return asr;
}
