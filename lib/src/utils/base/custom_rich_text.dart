import 'package:flutter/material.dart';
import '../extensions.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String title1, title2;
  final bool underline1, underline2;
  final Color? color1, color2;
  final FontWeight? fontWeight;
  final double? fontSize1, fontSize2;
  final void Function()? onTap;
  final int? maxLines;
  const CustomRichTextWidget(
      {super.key,
      required this.title1,
      required this.title2,
      this.color2 = const Color(0xff593460),
      this.color1 = const Color(0xff998a9e),
      this.fontSize1 = 15,
      this.fontSize2 = 18,
      this.onTap,
      this.maxLines,
      this.underline1 = false,
      this.underline2 = false,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: maxLines,
        text: TextSpan(children: [
          TextSpan(
            text: title1,
            style: TextStyle(
              fontFamily: 'AlexandriaFLF',
              color: color1,
              fontWeight: fontWeight,
              fontSize: fontSize1,
              decoration: underline1 ? TextDecoration.underline : null,
            ),
          ),
          TextSpan(
            text: title2,
            style: TextStyle(
              fontFamily: 'AlexandriaFLF',
              color: color2,
              fontWeight: fontWeight,
              fontSize: fontSize2,
              decoration: underline2 ? TextDecoration.underline : null,
            ),
          ),
        ])).makeWidgetGestureClickable(context, onTap: onTap);
  }
}
