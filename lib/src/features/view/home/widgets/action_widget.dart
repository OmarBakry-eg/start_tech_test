import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/home/state_management/home_controller.dart';
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
            Constants.navigateTo('/up_info');
          }
          if (title == "Logout") {
            Get.find<HomeController>().logout();
          }
          if (title == "Change Password") {
            Constants.navigateTo('/up_password');
          }
          if (title == "Delete Account") {
            Get.find<HomeController>().deleteUser();
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
