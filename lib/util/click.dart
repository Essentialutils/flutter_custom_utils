import 'package:flutter/material.dart';

/// A customizable widget that wraps its child with hover and tap functionality.
///
/// The `CClick` widget provides an easy way to add interactive behaviors to any widget,
/// including hover effects, tap, double tap, and long press actions. It also allows
/// customization of the mouse cursor when hovering over the widget.
///
/// Example usage:
/// ```dart
/// CClick(
///   onTap: () => print('Tapped!'),
///   onHover: (isHovering) => print('Hover state: $isHovering'),
///   child: Container(
///     width: 100,
///     height: 100,
///     color: Colors.blue,
///     child: Center(child: Text('Click me')),
///   ),
/// )
/// ```
class CClick extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget child;

  /// Called when a pointer enters or exits the widget's bounds.
  ///
  /// The boolean parameter indicates whether the pointer is hovering (true)
  /// or not hovering (false) over the widget.
  final Function(bool)? onHover;

  /// Called when the widget is tapped.
  final Function()? onTap;

  /// Called when the widget is double tapped.
  final Function()? onDoubleTap;

  /// Called when the widget is long-pressed.
  final Function()? onLongPress;

  /// The mouse cursor to be used when hovering over the widget.
  ///
  /// Defaults to [SystemMouseCursors.click].
  final MouseCursor cursor;

  /// Creates a CClick widget.
  ///
  /// The [child] parameter must not be null.
  const CClick({
    super.key,
    required this.child,
    this.onHover,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.cursor = SystemMouseCursors.click,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: cursor,
      onEnter: (v) {
        onHover?.call(true);
      },
      onExit: (v) {
        onHover?.call(false);
      },
      child: GestureDetector(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onTapDown: (v) {
          onHover?.call(false);
        },
        onTapUp: (v) {
          onHover?.call(true);
        },
        child: child,
      ),
    );
  }
}
