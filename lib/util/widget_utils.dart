import 'package:flutter/material.dart';

extension CustomWidgetPadding on Widget {
  /// Adds uniform padding to all sides of the widget.
  ///
  /// Parameters:
  /// - `padding`: The amount of padding to apply to all sides.
  ///
  /// Returns:
  /// A new widget with the specified padding.
  Widget cPadAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  /// Adds horizontal and vertical padding to the widget.
  ///
  /// Parameters:
  /// - `h`: The amount of horizontal padding.
  /// - `v`: The amount of vertical padding.
  ///
  /// Returns:
  /// A new widget with the specified horizontal and vertical padding.
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

  /// Adds padding to specific sides of the widget (left, top, right, bottom).
  ///
  /// Parameters:
  /// - `l`: The amount of padding on the left side.
  /// - `t`: The amount of padding on the top side.
  /// - `r`: The amount of padding on the right side.
  /// - `b`: The amount of padding on the bottom side.
  ///
  /// Returns:
  /// A new widget with the specified padding on the specified sides.
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

  /// Removes all padding from the widget.
  ///
  /// Returns:
  /// A new widget with no padding.
  Widget get cPadZero => Padding(
        padding: EdgeInsets.zero,
        child: this,
      );
}

/// A Dart extension for adding margin to a Widget using [Container].
extension CustomWidgetMargin on Widget {
  /// Adds margin to all sides of the widget.
  ///
  /// [margin] specifies the margin value to be applied to all sides.
  Widget cMargAll(double margin) => Container(
        margin: EdgeInsets.all(margin),
        child: this,
      );

  /// Adds symmetric margin to the widget.
  ///
  /// [h] specifies the horizontal margin, and [v] specifies the vertical margin.
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

  /// Adds margin to specific sides of the widget.
  ///
  /// You can specify the margin for each side individually: [l] (left), [t] (top),
  /// [r] (right), and [b] (bottom).
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

  /// Adds zero margin to the widget.
  ///
  /// This effectively removes any margin around the widget.
  Widget get cMargZero => Container(
        margin: EdgeInsets.zero,
        child: this,
      );
}

/// A Dart extension for applying clipping with `ClipRRect` to a Widget.
extension CustomWidgetClipRRect on Widget {
  /// Clip the widget with a uniform radius on all corners.
  ///
  /// [radius] specifies the radius for all four corners.
  Widget cClipAll(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );

  /// Clip the widget with different horizontal radii for left and right corners.
  ///
  /// [l] specifies the radius for the left corner, and [r] specifies the radius for the right corner.
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

  /// Clip the widget with different vertical radii for top and bottom corners.
  ///
  /// [t] specifies the radius for the top corner, and [b] specifies the radius for the bottom corner.
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

  /// Clip the widget with different radii for each corner.
  ///
  /// You can specify the radius for each corner individually:
  /// [tl] (top-left), [tr] (top-right), [bl] (bottom-left), and [br] (bottom-right).
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

/// A Dart extension for converting a Widget into a SliverToBoxAdapter.
extension CustomWidgetSliverBox on Widget {
  /// Converts the widget into a SliverToBoxAdapter.
  ///
  /// This extension allows you to use a regular Widget within a SliverList, SliverGrid,
  /// or other Sliver-based widgets by wrapping it in a SliverToBoxAdapter.
  Widget get cToSliver => SliverToBoxAdapter(
        child: this,
      );
}

/// A Dart extension for adding visibility, opacity, absorption, and shadow effects to a Widget.
extension CustomWidgetVisibility on Widget {
  /// Set the visibility of the widget.
  ///
  /// [visible] specifies whether the widget should be visible or not.
  Widget cVisible(bool visible) => Visibility(
        visible: visible,
        child: this,
      );

  /// Set the opacity of the widget.
  ///
  /// [opacity] specifies the opacity level, with 0.0 being completely transparent and 1.0 being fully opaque.
  Widget cOpacity(double opacity) => Opacity(
        opacity: opacity,
        child: this,
      );

  /// Disable clicks on the widget.
  ///
  /// [absorb] specifies whether the widget should absorb pointer events, effectively disabling clicks.
  Widget cAbsorb(bool absorb) => AbsorbPointer(
        absorbing: absorb,
        child: this,
      );

  /// Add a shadow effect to the widget.
  ///
  /// This extension allows you to add a shadow effect to a widget using `PhysicalModel`.
  ///
  /// [shape] specifies the shape of the widget.
  ///
  /// [clipBehavior] specifies the clipping behavior.
  ///
  /// [borderRadius] specifies the border radius for rounded corners (optional).
  ///
  /// [elevation] specifies the shadow elevation.
  ///
  /// [color] specifies the color of the shadow.
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

/// A Dart extension for positioning and aligning widgets.
extension CustomWidgetPosition on Widget {
  /// Center the widget within its parent.
  ///
  /// This extension wraps the widget with a [Center] widget to horizontally and vertically center it.
  Widget get cToCenter => Center(
        child: this,
      );

  /// Align the widget within its parent using a specified alignment.
  ///
  /// [align] specifies the alignment of the widget within its parent.
  Widget cAlignment(AlignmentGeometry align) => Align(
        alignment: align,
        child: this,
      );

  /// Position the widget at specific offsets from the top, bottom, left, or right within its parent.
  ///
  /// You can specify the position by providing values for [t] (top), [b] (bottom), [l] (left), or [r] (right).
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

  /// Make the widget expand to fill available space with a specified flex factor.
  ///
  /// [flex] specifies the flex factor that determines how much space the widget should occupy compared to other widgets
  /// when using [Expanded] or [Flexible] in a flex container.
  Widget cExpanded(int flex) => Expanded(
        child: this,
        flex: flex,
      );
}

/// A Dart extension for customizing the size and behavior of widgets.
extension CustomWidget on Widget {
  ///
  /// Create a widget with a preferred size.
  ///
  /// [h] specifies the preferred height of the widget.
  ///
  /// This extension wraps the widget with a [PreferredSize] widget, allowing you to set a preferred height for it.
  PreferredSizeWidget cPreferSize(double h) => PreferredSize(
        child: this,
        preferredSize: Size.fromHeight(h),
      );

  ///
  /// Create a widget with a fixed size.
  ///
  /// [h] specifies the fixed height of the widget (can be null for unconstrained height).
  /// [w] specifies the fixed width of the widget (can be null for unconstrained width).
  ///
  /// This extension wraps the widget with a [SizedBox], allowing you to set a specific size for it.
  Widget cSizedBox(double? h, double? w) => SizedBox(
        child: this,
        height: h,
        width: w,
      );

  ///
  /// Create a widget for hero animations.
  ///
  /// [tag] specifies the unique tag for the hero animation.
  ///
  /// This extension wraps the widget with a [Hero], enabling you to use it in hero animations.
  Widget cHero(Object tag) => Hero(
        child: this,
        tag: tag,
      );

  ///
  /// Create a widget with a specific aspect ratio.
  ///
  /// [ratio] specifies the desired aspect ratio (width / height).
  ///
  /// This extension wraps the widget with an [AspectRatio] widget, allowing you to set a specific aspect ratio.
  Widget cAspectRatio(double ratio) => AspectRatio(
        child: this,
        aspectRatio: ratio,
      );
}

/// A set of extensions on the base [Widget] class to add custom banner functionality.
extension CustomWidgetBanner on Widget {
  /// Wraps the widget with a banner if not disabled.
  ///
  /// If [disable] is true, the original widget is returned unchanged.
  /// Otherwise, a [Banner] widget is added with the specified [location], [message],
  /// [color], and optional [crop] parameters.
  ///
  /// Example:
  ///
  /// ```dart
  /// Widget myWidget = ...;
  /// Widget bannerWidget = myWidget.cBanner(
  ///   disable: false,
  ///   location: BannerLocation.topStart,
  ///   message: 'Custom Banner',
  ///   color: Colors.red
  /// );
  /// ```
  Widget cBanner({
    bool disable = false,
    required BannerLocation location,
    required String message,
    required Color color,
    double crop = 0,
  }) =>
      disable
          ? this
          : Banner(
              message: message,
              location: location,
              color: color,
              child: this,
            ).cClipAll(crop);
}
