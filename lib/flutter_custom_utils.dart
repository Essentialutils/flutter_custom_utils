library flutter_custom_utils;

import 'package:flutter/widgets.dart';


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
  return (MediaQuery.of(context).size.width / width).round();
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
  return w / (h - (width - height));
}
