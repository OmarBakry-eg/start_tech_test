import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/home/state_management/home_controller.dart';
import 'package:start_tech_test/src/utils/base/custom_button.dart';
import 'package:start_tech_test/src/utils/base/custom_text_field.dart';
import 'package:start_tech_test/src/utils/base/custom_text_widget.dart';
import 'package:start_tech_test/src/utils/helpers/form_validation.dart';

class UpdateInformationPage extends StatelessWidget {
  const UpdateInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 67,
        backgroundColor: const Color.fromARGB(255, 46, 12, 52),
        title: const CustomTextWidget(
          title: 'Update Information',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      body: Form(
        key: homeController.updateDataFormKey,
        child: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    CustomTextField(
                      validator: FormValidator.generalEmptyValidator,
                      screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                      hintText: homeController.userModel?.data?.name ?? 'Full Name',
                      hintColor: const Color(0xFFABABAB),
                      border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                      controller: homeController.nameEditingController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      validator: FormValidator.signUpPhoneNumberValidator,
                      screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 65),
                      hintText: homeController.userModel?.data?.phone ?? '55994435',
                      hintColor: const Color(0xFFABABAB),
                      border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                      controller: homeController.phoneEditingController,
                      addCountryPicker: true,
                      holdUpValue: homeController.countryValue,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      validator: FormValidator.emailOrPhoneValidator,
                      screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                      hintText:
                          homeController.userModel?.data?.email ?? 'Email Address',
                      hintColor: const Color(0xFFABABAB),
                      border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                      controller: homeController.emailEditingController,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    CustomButton(
                      onTap: () {
                        homeController.updateUserData();
                      },
                      title: 'Save',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
