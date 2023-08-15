import 'package:flutter/material.dart';
import 'package:start_tech_test/src/utils/extensions.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Widget? childWidget;
  final double? fontSize, width, height;
  final Color? textColor, fillColor;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? contentPadding;
  final bool reverseStyle;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    this.childWidget,
    this.title,
    this.onTap,
    this.contentPadding,
    this.fontSize = 18,
    this.width = 250,
    this.height = 45,
    this.textColor = Colors.white,
    this.fillColor = const Color(0xff593460),
    this.fontWeight = FontWeight.w800,
    this.reverseStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: contentPadding,
      decoration: BoxDecoration(
          border: reverseStyle
              ? Border.all(
                  color: const Color(0xff593460),
                )
              : null,
          color: reverseStyle ? Colors.white : fillColor,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: childWidget ??
            Text(title ?? "",
                style: TextStyle(
                    fontFamily: 'AlexandriaFLF',
                    fontSize: fontSize,
                    color: reverseStyle ? const Color(0xff593460) : textColor,
                    fontWeight: fontWeight)),
      ),
    ).makeWidgetGestureClickable(context, onTap: onTap);
  }
}
