import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
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
  List<String> profileTitles = [];
  List<IconData> profileIcons = [
    Icons.person_outline,
    Icons.phone_android,
    Icons.email_outlined,
  ];
  List<String> actionsTitle = [
    'Update Information',
    "Change Password",
    "Delete Account",
    "Logout",
  ];

//? Get Current User Logic
  UserModel? userModel;
  Future<UserModel?> getCurrentUser() async {
    userModel = await homeAPIController.getCurrentUser(
        userID:
            authController.model?.data?.id ?? await _localStorage.getUserID);
    profileTitles.clear();
    profileTitles.addAll([
      userModel?.data?.name ?? "",
      userModel?.data?.phone ?? "",
      userModel?.data?.email ?? ""
    ]);
    update();
    return userModel;
  }

//? Update User Logic
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();

  final StringBuffer countryValue = StringBuffer();
  var updateDataFormKey = GlobalKey<FormState>();

  Future<bool> updateUserData() async {
    if (updateDataFormKey.currentState!.validate()) {
      bool res = await homeAPIController.updateUserDataFunc(
          email: emailEditingController.text,
          name: nameEditingController.text,
          countryCode: countryValue.toString(),
          phone: phoneEditingController.text);
      if (res) {
        Constants.hideLoadingOrNavBack;
        await getCurrentUser();
        Get.snackbar('Success', 'You data successfully updated',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      }
    }
    return false;
  }

//? Update User Password Logic
  final TextEditingController oldPasswordEditingController =
      TextEditingController();
  final TextEditingController newPasswordEditingController =
      TextEditingController();

  Future<bool> updateUserPassword() async {
    bool res = await homeAPIController.changePasswordFunc(
        oldPassword: oldPasswordEditingController.text,
        newPassword: newPasswordEditingController.text);
    if (res) {
      Constants.hideLoadingOrNavBack;
      await getCurrentUser();
      Get.snackbar('Success', 'You data successfully updated',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }

    return false;
  }

//? Delete User
  Future deleteUser() async {
    return Constants.dialogMessage(
        dialogType: DialogType.warning,
        title: 'Alert',
        removeCancelButton: false,
        description: 'Are you sure you want to delete your account?',
        // onCancelPressed: () {
        //   return false;
        // },
        onOkPressed: () async {
          bool res = await homeAPIController.deletUserFunc();
          if (res) {
            Constants.navigateTo('/welcome', pushAndRemoveUntil: true);
          }
          return res;
        });
  }

//? Logout
  void logout() async {
    Constants.navigateTo('/welcome', pushAndRemoveUntil: true);
    await _localStorage.removeToken;
    await _localStorage.removeUserID;
  }

//! Private methods
  void _initlogic() {
    if (authController.model != null) {
      userModel = authController.model;
      profileTitles.clear();
      profileTitles.addAll([
        userModel?.data?.name ?? "",
        userModel?.data?.phone ?? "",
        userModel?.data?.email ?? ""
      ]);
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
