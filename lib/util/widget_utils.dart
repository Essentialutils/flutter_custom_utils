import 'package:flutter/widgets.dart';

///
/// add Padding Property to widget
///
extension CustomWidgetPadding on Widget {
  Widget padAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget padSymmetric({
    double h = 0.0,
    double v = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: h,
          vertical: v,
        ),
        child: this,
      );

  Widget padOnly({
    double l = 0.0,
    double t = 0.0,
    double r = 0.0,
    double b = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          top: t,
          left: l,
          right: r,
          bottom: b,
        ),
        child: this,
      );

  Widget get padZero => Padding(
        padding: EdgeInsets.zero,
        child: this,
      );
}

///
/// Add margin property to widget
///
extension CustomWidgetMargin on Widget {
  Widget margAll(double margin) => Container(
        margin: EdgeInsets.all(margin),
        child: this,
      );

  Widget margSymmetric({
    double h = 0.0,
    double v = 0.0,
  }) =>
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: h,
          vertical: v,
        ),
        child: this,
      );

  Widget margOnly({
    double l = 0.0,
    double t = 0.0,
    double r = 0.0,
    double b = 0.0,
  }) =>
      Container(
        margin: EdgeInsets.only(
          top: t,
          left: l,
          right: r,
          bottom: b,
        ),
        child: this,
      );

  Widget get margZero => Container(
        margin: EdgeInsets.zero,
        child: this,
      );
}

///
/// Allows you to insert widgets inside a CustomScrollView
///
extension CustomWidgetSliverBox on Widget {
  Widget get sliverToBox => SliverToBoxAdapter(
        child: this,
      );
}
