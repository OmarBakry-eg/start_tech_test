import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/auth/state_management/auth_controller.dart';
import 'package:start_tech_test/src/features/controller/home/state_management/home_controller.dart';

class AllControllersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => HomeController());
  }
}
