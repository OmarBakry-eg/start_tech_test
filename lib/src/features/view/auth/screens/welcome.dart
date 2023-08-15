import 'package:flutter/material.dart';
import 'package:start_tech_test/src/features/view/auth/screens/login.dart';
import 'package:start_tech_test/src/features/view/auth/screens/register.dart';
import 'package:start_tech_test/src/features/view/auth/widgets/custom_auth_heading_widget.dart';
import 'package:start_tech_test/src/utils/base/custom_button.dart';
import 'package:start_tech_test/src/utils/base/custom_rich_text.dart';
import 'package:start_tech_test/src/utils/consts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAuthHeadingWidget(
              title: 'Welcome to the app',
            ),
            Column(
              children: [
                CustomButton(
                  onTap: () {
                    Constants.navigateTo(const LoginPage(),
                        pushReplacment: true);
                  },
                  title: 'Login',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () {
                    Constants.navigateTo(const RegisterPage(),
                        pushReplacment: true);
                  },
                  title: 'Register',
                  reverseStyle: true,
                ),
              ],
            ),
            const CustomRichTextWidget(
              title1: 'Designed & Developed by ',
              title2: 'Omar Bakry',
              underline2: true,
            )
          ],
        ),
      ),
    );
  }
}
