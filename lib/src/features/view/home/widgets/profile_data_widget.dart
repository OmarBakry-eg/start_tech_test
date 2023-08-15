

import 'package:flutter/material.dart';
import 'package:start_tech_test/src/utils/base/custom_text_widget.dart';

class ProfileDataWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  const ProfileDataWidget({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: const Color(0xff593460),
        ),
        const SizedBox(
          width: 15,
        ),
        CustomTextWidget(
          title: title,
          color: const Color(0xFFABABAB),
          fontSize: 18,
        ),
      ],
    );
  }
}
