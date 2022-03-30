import 'package:flutter/material.dart';

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
/// Allows you to add ClipRRect
///
extension CustomWidgetClipRRect on Widget {
  Widget cClipAll(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );

  Widget cClipHorizontal({
    double l = 0.0,
    double r = 0.0,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(l),
          right: Radius.circular(r),
        ),
        child: this,
      );

  Widget cClipVertical({
    double t = 0.0,
    double b = 0.0,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(t),
          bottom: Radius.circular(b),
        ),
        child: this,
      );

  Widget cClipOnly({
    double tl = 0.0,
    double tr = 0.0,
    double bl = 0.0,
    double br = 0.0,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(tl),
          topRight: Radius.circular(tr),
          bottomLeft: Radius.circular(bl),
          bottomRight: Radius.circular(br),
        ),
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
  Widget cAbsorb(bool absorb) => AbsorbPointer(
        absorbing: absorb,
        child: this,
      );

  ///
  /// this is used to add shadow in all widget
  ///
  Widget cShadow({
    BoxShape shape = BoxShape.rectangle,
    Clip clipBehavior = Clip.none,
    BorderRadius? borderRadius,
    double elevation = 0.0,
    Color color = Colors.transparent,
  }) =>
      PhysicalModel(
        shape: shape,
        clipBehavior: clipBehavior,
        borderRadius: borderRadius,
        elevation: elevation,
        color: color,
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
  Widget cPosition({
    double? t,
    double? b,
    double? l,
    double? r,
  }) =>
      Positioned(
        top: t,
        bottom: b,
        left: l,
        right: r,
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
