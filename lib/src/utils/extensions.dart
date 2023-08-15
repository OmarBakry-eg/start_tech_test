import 'package:flutter/material.dart';

extension Edits on Widget {

  StatelessWidget makeWidgetGestureClickable(BuildContext context,
      {void Function()? onTap, bool useInkWell = false}) {
    return useInkWell
        ? InkWell(
            onTap: onTap,
            child: this,
          )
        : GestureDetector(
            onTap: onTap,
            child: this,
          );
  }

  Align addingAlign(BuildContext context,
      {required AlignmentGeometry alignmentGeometry}) {
    return Align(
      alignment: alignmentGeometry,
      child: this,
    );
  }

  Padding addPadding(BuildContext context,
      {required EdgeInsetsGeometry edgeInsetsGeometry}) {
    return Padding(
      padding: edgeInsetsGeometry,
      child: this,
    );
  }

  SizedBox addSizedBox(
    BuildContext context, {
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }
}  