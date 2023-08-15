
import 'package:flutter/material.dart';
import 'package:start_tech_test/src/utils/base/custom_text_widget.dart';

class CustomAuthHeadingWidget extends StatelessWidget {
  final String title;
  const CustomAuthHeadingWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/img/logo.png',
          width: 120,
          height: 120,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextWidget(title: title),
      ],
    );
  }
}
