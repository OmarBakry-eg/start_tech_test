import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/auth/state_management/auth_controller.dart';
import 'package:start_tech_test/src/features/view/auth/widgets/custom_auth_heading_widget.dart';
import 'package:start_tech_test/src/utils/base/custom_button.dart';
import 'package:start_tech_test/src/utils/base/custom_rich_text.dart';
import 'package:start_tech_test/src/utils/base/custom_text_field.dart';
import 'package:start_tech_test/src/utils/consts.dart';
import 'package:start_tech_test/src/utils/helpers/form_validation.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      body: Center(
        child: Form(
          key: authController.signUpFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomAuthHeadingWidget(title: 'Register'),
              Column(
                children: [
                  CustomTextField(
                    validator: FormValidator.generalEmptyValidator,
                    screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                    hintText: 'Full Name',
                    hintColor: const Color(0xFFABABAB),
                    border:
                        Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                    controller: authController.nameTextEditingController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    validator: FormValidator.signUpPhoneNumberValidator,
                    screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 65),
                    hintText: '55994435',
                    hintColor: const Color(0xFFABABAB),
                    border:
                        Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                    controller: authController.phoneTextEditingController,
                    addCountryPicker: true,
                    holdUpValue: authController.countryCodeForSignUp,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    validator: FormValidator.emailOrPhoneValidator,
                    screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                    hintText: 'Email Address',
                    hintColor: const Color(0xFFABABAB),
                    border:
                        Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                    controller: authController.emailTextEditingController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() => CustomTextField(
                        //  validator: FormValidator.passwordValidator,
                        obscureText: authController.obsecureRegister.value,
                        suffixIcon: IconButton(
                            onPressed: () {
                              authController.obsecureRegLogic();
                            },
                            icon: Icon(
                              authController.obsecureRegister.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: const Color(0xFFABABAB),
                            )),
                        screenPadding:
                            const EdgeInsets.symmetric(horizontal: 95),
                        hintText: 'Password',
                        hintColor: const Color(0xFFABABAB),
                        border: Border.all(
                            width: 1, color: const Color(0xFFE0E0E0)),
                        controller:
                            authController.passwordTextEditingController,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() => CustomTextField(
                        validator: (String? val) {
                          return FormValidator.confirmPasswordValidator(
                              val,
                              authController
                                  .passwordTextEditingController.text);
                        },
                        obscureText: authController.obsecureConfirm.value,
                        suffixIcon: IconButton(
                            onPressed: () {
                              authController.obsecureConfirmLogic();
                            },
                            icon: Icon(
                              authController.obsecureConfirm.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: const Color(0xFFABABAB),
                            )),
                        screenPadding:
                            const EdgeInsets.symmetric(horizontal: 95),
                        hintText: 'Confirm Password',
                        hintColor: const Color(0xFFABABAB),
                        border: Border.all(
                            width: 1, color: const Color(0xFFE0E0E0)),
                        controller:
                            authController.confirmPasswordTextEditingController,
                      )),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomButton(
                    onTap: () {
                      authController.signUpFunc();
                    },
                    title: 'Register',
                  ),
                ],
              ),
              CustomRichTextWidget(
                title1: "Already have an account? ",
                title2: "Login",
                onTap: () {
                  Constants.navigateTo('/login', pushAndRemoveUntil: true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
