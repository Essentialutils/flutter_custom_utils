import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

OverlayEntry? cAlertOverlayEntry;

void cShowAlwaysOnTopAlert({
  required BuildContext context,
  required String message,
  String? title,
  String? okText,
  Function()? ok,
  String? cancelText,
  Function()? cancel,
  double width = 400,
}) {
  if (cAlertOverlayEntry != null) {
    // If an alert is already being shown, remove it first
    cAlertOverlayEntry!.remove();
  }

  cAlertOverlayEntry = OverlayEntry(
    builder: (context) => TopAlert(
      message: message,
      title: title,
      ok: ok,
      okText: okText,
      cancelText: cancelText,
      cancel: cancel,
      width: width,
    ),
  );

  // Insert the overlay entry into the overlay
  Overlay.of(context).insert(cAlertOverlayEntry!);
}

void cCloseAlwaysOnTopAlert() {
  cAlertOverlayEntry?.remove();
  cAlertOverlayEntry = null;
}

class TopAlert extends StatefulWidget {
  final String? title;
  final String message;
  final Function()? ok;
  final String? okText;
  final Function()? cancel;
  final String? cancelText;
  final double width;
  const TopAlert({
    super.key,
    this.title,
    required this.message,
    required this.width,
    this.cancel,
    this.ok,
    this.okText,
    this.cancelText,
  });

  @override
  State<TopAlert> createState() => TopAlertState();
}

class TopAlertState extends State<TopAlert> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.cIsTablet ? widget.width : context.cWidth - 50,
            maxHeight: context.cHeight - 50,
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null)
                Text(
                  widget.title ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              Text(
                widget.message,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ).cPadOnly(t: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.cancel != null)
                    OutlinedButton(
                      onPressed: () {
                        widget.cancel?.call();
                      },
                      child: Text(
                        widget.cancelText ?? 'Cancel',
                        style: TextStyle(fontSize: 18),
                      ),
                    ).cPadOnly(r: 5),
                  if (widget.ok != null)
                    OutlinedButton(
                      onPressed: () {
                        widget.ok?.call();
                      },
                      child: Text(
                        widget.okText ?? 'OK',
                        style: TextStyle(fontSize: 18),
                      ),
                    ).cPadOnly(r: 5),
                ],
              ).cAlignment(Alignment.bottomRight).cPadOnly(t: 10),
            ],
          ),
        ),
      ),
    );
  }
}
