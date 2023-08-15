import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/auth/state_management/auth_controller.dart';
import 'package:start_tech_test/src/features/view/auth/screens/register.dart';
import 'package:start_tech_test/src/features/view/auth/widgets/custom_auth_heading_widget.dart';
import 'package:start_tech_test/src/utils/base/custom_button.dart';
import 'package:start_tech_test/src/utils/base/custom_rich_text.dart';
import 'package:start_tech_test/src/utils/base/custom_text_field.dart';
import 'package:start_tech_test/src/utils/consts.dart';
import 'package:start_tech_test/src/utils/helpers/form_validation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: authController.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomAuthHeadingWidget(title: 'Login'),
              Column(
                children: [
                  CustomTextField(
                    validator: FormValidator.emailOrPhoneValidator,
                    screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                    hintText: 'Email Address',
                    hintColor: const Color(0xFFABABAB),
                    border:
                        Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                    controller:
                        authController.emailTextEditingControllerForLogin,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() => CustomTextField(
                        validator: FormValidator.passwordValidator,
                        obscureText: authController.obsecureLogin.value,
                        suffixIcon: IconButton(
                            onPressed: () {
                              authController.obsecureLoginLogic();
                            },
                            icon: Icon(
                              authController.obsecureLogin.value
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
                        controller: authController
                            .passwordTextEditingControllerForLogin,
                      )),
                  const SizedBox(
                    height: 26,
                  ),
                  CustomButton(
                    onTap: () {
                      authController.loginFunc();
                    },
                    title: 'Login',
                  ),
                ],
              ),
              CustomRichTextWidget(
                title1: "Don't have an account? ",
                title2: "Register",
                onTap: () {
                  Constants.navigateTo(const RegisterPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
