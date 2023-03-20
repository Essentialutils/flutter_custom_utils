import 'package:flutter/widgets.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

///
/// GridView responsive item [crossAxisCount]
///
///  [width] is your grid item width
///
///
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

///
/// GridView responsive item [childAspectRatio]
///
/// provide [height],[width] of your child design
///
///
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

///
/// GridView item [childAspectRatio]
///
/// provide [height],[width] of your child design
///
/// and [crossAxisCount] also
///
///
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
