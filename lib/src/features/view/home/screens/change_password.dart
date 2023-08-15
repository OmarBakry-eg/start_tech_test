import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/home/state_management/home_controller.dart';
import 'package:start_tech_test/src/utils/base/custom_button.dart';
import 'package:start_tech_test/src/utils/base/custom_text_field.dart';
import 'package:start_tech_test/src/utils/base/custom_text_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 67,
        backgroundColor: const Color.fromARGB(255, 46, 12, 52),
        title: const CustomTextWidget(
          title: 'Change Password',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: homeController.updateDataFormKey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                CustomTextField(
                  screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                  hintText: 'Old Password',
                  hintColor: const Color(0xFFABABAB),
                  border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                  controller: homeController.oldPasswordEditingController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                  hintText: 'New Password',
                  hintColor: const Color(0xFFABABAB),
                  border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                  controller: homeController.newPasswordEditingController,
                ),
                const SizedBox(
                  height: 26,
                ),
                CustomButton(
                  onTap: () {
                    homeController.updateUserPassword();
                  },
                  title: 'Save',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
