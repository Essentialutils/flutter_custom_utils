import 'package:flutter/widgets.dart';

///
/// add Padding Property to widget
///
extension CustomWidgetPadding on Widget {
  Widget cPadAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget cPadSymmetric({
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

  Widget cPadOnly({
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

  Widget get cPadZero => Padding(
        padding: EdgeInsets.zero,
        child: this,
      );
}

///
/// Add margin property to widget
///
extension CustomWidgetMargin on Widget {
  Widget cMargAll(double margin) => Container(
        margin: EdgeInsets.all(margin),
        child: this,
      );

  Widget cMargSymmetric({
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

  Widget cMargOnly({
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

  Widget get cMargZero => Container(
        margin: EdgeInsets.zero,
        child: this,
      );
}

///
/// Allows you to insert widgets inside a CustomScrollView
///
extension CustomWidgetSliverBox on Widget {
  Widget get cToSliver => SliverToBoxAdapter(
        child: this,
      );
}

///
/// Allows you to handle Visibility and Opacity
///
extension CustomWidgetVisibility on Widget {
  Widget cVisible(bool visible) => Visibility(
        visible: visible,
        child: this,
      );

  Widget cOpacity(double opacity) => Opacity(
        opacity: opacity,
        child: this,
      );
}

///
/// Allows you to handle alignment
///
extension CustomWidetPosition on Widget {
  Widget get cToCenter => Center(
        child: this,
      );
  Widget cAlignment(AlignmentGeometry align) => Align(
        alignment: align,
        child: this,
      );
  Widget cExpanded(int flex) => Expanded(
        child: this,
        flex: flex,
      );
}

///
/// PreferredSize
///
extension CustomWidetPreferSize on Widget {
  PreferredSizeWidget cPreferSize(double h) => PreferredSize(
        child: this,
        preferredSize: Size.fromHeight(h),
      );
}
