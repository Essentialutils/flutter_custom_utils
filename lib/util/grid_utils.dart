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
}) {
  int count = (context.cWidth / width).round();
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
}) {
  double w = (context.cWidth / (context.cWidth / width).round());
  double h = (context.cWidth / (context.cWidth / width));
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
}) {
  double w = (context.cWidth / crossAxisCount);
  double h = (context.cWidth / (context.cWidth / width));
  double asr = w / (h - (width - height));
  if (logData) {
    cLog('GridAspectRatio => $asr');
  }
  return asr;
}
