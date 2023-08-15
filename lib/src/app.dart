import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/view/auth/screens/login.dart';
import 'package:start_tech_test/src/features/view/auth/screens/register.dart';
import 'package:start_tech_test/src/features/view/auth/screens/welcome.dart';
import 'package:start_tech_test/src/features/view/home/screens/change_password.dart';
import 'package:start_tech_test/src/features/view/home/screens/home_screen.dart';
import 'package:start_tech_test/src/features/view/home/screens/update_information.dart';

import 'core/binding/controllers_binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/welcome',
          page: () => const WelcomeScreen(),
        ),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            binding: AuthControllersBinding()),
        GetPage(
          name: '/register',
          page: () => const RegisterPage(),
          binding: AuthControllersBinding(),
        ),
        GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            bindings: [AuthControllersBinding(), HomeControllersBinding()]),
        GetPage(
            name: '/up_info',
            page: () => const UpdateInformationPage(),
            bindings: [AuthControllersBinding(), HomeControllersBinding()]),
        GetPage(
            name: '/up_password',
            page: () => const ChangePasswordPage(),
            bindings: [AuthControllersBinding(), HomeControllersBinding()]),
      ],
      initialRoute: '/welcome',
    );
  }
}
