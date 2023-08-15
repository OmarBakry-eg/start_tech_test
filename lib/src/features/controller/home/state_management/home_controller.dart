import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/auth/state_management/auth_controller.dart';
import 'package:start_tech_test/src/features/controller/home/API/home_api_controller.dart';
import 'package:start_tech_test/src/features/local_storage/local_storage.dart';
import 'package:start_tech_test/src/features/model/user_model.dart';
import 'package:start_tech_test/src/utils/consts.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find();
  final HomeAPIController homeAPIController = HomeAPIController();
  final LocalStorage _localStorage = LocalStorage();

//? Get Current User Logic
  UserModel? userModel;
  Future<UserModel?> getCurrentUser() async {
    userModel = await homeAPIController.getCurrentUser(
        userID:
            authController.model?.data?.id ?? await _localStorage.getUserID);
    update();
    return userModel;
  }

//? Update User Logic
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final StringBuffer countryValue = StringBuffer();
  var updateDataFormKey = GlobalKey<FormState>();

  Future<bool> updateUserData() async {
    if (updateDataFormKey.currentState!.validate()) {
      bool res = await homeAPIController.updateUserDataFunc(
          email: emailEditingController.text,
          countryCode: countryValue.toString(),
          phone: phoneEditingController.text);
      if (res) {
        Constants.hideLoadingOrNavBack;
        await getCurrentUser();
        Get.snackbar('Success', 'You data successfully updated');
      }
    }
    return false;
  }

//? Update User Password Logic
  final TextEditingController oldPasswordEditingController =
      TextEditingController();
  final TextEditingController newPasswordEditingController =
      TextEditingController();

  var changePasswordFormKey = GlobalKey<FormState>();
  Future<bool> updateUserPassword() async {
    if (changePasswordFormKey.currentState!.validate()) {
      bool res = await homeAPIController.changePasswordFunc(
          oldPassword: oldPasswordEditingController.text,
          newPassword: newPasswordEditingController.text);
      if (res) {
        Constants.hideLoadingOrNavBack;
        await getCurrentUser();
        Get.snackbar('Success', 'You data successfully updated');
      }
    }
    return false;
  }

//! Private methods
  void _initlogic() {
    if (authController.model != null) {
      userModel = authController.model;
      return;
    }
    getCurrentUser();
  }

  @override
  void onInit() {
    super.onInit();
    _initlogic();
  }
}
