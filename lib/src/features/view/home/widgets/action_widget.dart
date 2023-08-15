import 'package:flutter/material.dart';
import 'package:start_tech_test/src/features/view/home/screens/update_information.dart';
import 'package:start_tech_test/src/utils/base/custom_rounded_container.dart';
import 'package:start_tech_test/src/utils/base/custom_text_widget.dart';
import 'package:start_tech_test/src/utils/consts.dart';

class ActionWidget extends StatelessWidget {
  final String title;
  const ActionWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
        onTap: () {
          if (title == "Update Information") {
            Constants.navigateTo(const UpdateInformationPage());
          }
        },
        raduis: 8,
        screenPadding: const EdgeInsets.symmetric(horizontal: 5),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 1, offset: Offset(0.0, 1))
        ],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        child: Row(
          children: [
            CustomTextWidget(
              title: title,
              fontSize: 20,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff593460),
            ),
          ],
        ));
  }
}
