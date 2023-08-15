import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextStyle? style;
  final double? letterSpacing;
  final TextAlign? textAlign;
  const CustomTextWidget(
      {super.key,
      required this.title,
      this.color = const Color(0xff593460),
      this.fontSize = 25,
      this.fontWeight = FontWeight.w500,
      this.textAlign,
      this.style,
      this.letterSpacing = 0.3});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: null,
      textAlign: textAlign,
      style: style ??
          TextStyle(
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: 'AlexandriaFLF',
          ),
    );
  }
}
