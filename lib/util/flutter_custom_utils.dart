library flutter_custom_utils;

import 'package:flutter/widgets.dart';
import 'package:flutter_custom_utils/util/utils.dart';

///
/// GridView responsive item [crossAxisCount]
///
///  [width] is your grid item width
///
///
int getResCrosCountGrid({
  required BuildContext context,
  required int width,
}) {
  int count = (getSize(context).width / width).round();
  cLog('GridCount => $count');
  return count;
}

///
/// GridView responsive item [childAspectRatio]
///
/// provide [height],[width] of your child design
///
///

double getResGridRatio({
  required BuildContext context,
  required int height,
  required int width,
}) {
  double w =
      (getSize(context).width / (getSize(context).width / width).round());
  double h = (getSize(context).width / (getSize(context).width / width));
  double asr = w / (h - (width - height));
  cLog('GridAspectRatio => $asr');
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

double getGridRatio({
  required BuildContext context,
  required int crossAxisCount,
  required int height,
  required int width,
}) {
  double w = (getSize(context).width / crossAxisCount);
  double h = (getSize(context).width / (getSize(context).width / width));
  double asr = w / (h - (width - height));
  cLog('GridAspectRatio => $asr');
  return asr;
}

///
/// get MediaQuery size
///
Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
