import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/view/auth/screens/welcome.dart';

import 'core/binding/controllers_binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllControllersBinding(),
      home: const WelcomeScreen(),
    );
  }
}
