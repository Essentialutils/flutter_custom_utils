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
  int count = (MediaQuery.of(context).size.width / width).round();
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
  double w = (MediaQuery.of(context).size.width /
      (MediaQuery.of(context).size.width / width).round());
  double h = (MediaQuery.of(context).size.width /
      (MediaQuery.of(context).size.width / width));
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
  double w = (MediaQuery.of(context).size.width / crossAxisCount);
  double h = (MediaQuery.of(context).size.width /
      (MediaQuery.of(context).size.width / width));
  double asr = w / (h - (width - height));
  cLog('GridAspectRatio => $asr');
  return asr;
}
