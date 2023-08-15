import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/auth/API/auth_api_controller.dart';
import 'package:start_tech_test/src/features/model/user_model.dart';
import 'package:start_tech_test/src/utils/consts.dart';

class AuthController extends GetxController {
  final AuthAPIController authAPIController = AuthAPIController();
  UserModel? model;

//? RX
  RxBool obsecureRegister = true.obs;
  RxBool obsecureLogin = true.obs;
  RxBool obsecureConfirm = true.obs;

  void obsecureRegLogic() {
    obsecureRegister.value = !obsecureRegister.value;
  }

  void obsecureLoginLogic() {
    obsecureLogin.value = !obsecureLogin.value;
  }

  void obsecureConfirmLogic() {
    obsecureConfirm.value = !obsecureConfirm.value;
  }

//? Sign up logic
  final StringBuffer countryCodeForSignUp = StringBuffer();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  var signUpFormKey = GlobalKey<FormState>();
  Future<UserModel?> signUpFunc() async {
    if (signUpFormKey.currentState!.validate()) {
      model = await authAPIController.signUpFunc(
          name: nameTextEditingController.text,
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text,
          countryCode: countryCodeForSignUp.toString(),
          phone: phoneTextEditingController.text);
      if (model != null) {
        Constants.navigateTo('/home', pushAndRemoveUntil: true);
        return model;
      }
      return null;
    }
    return null;
  }

//? Sign In logic
  TextEditingController emailTextEditingControllerForLogin =
      TextEditingController();
  TextEditingController passwordTextEditingControllerForLogin =
      TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  Future<UserModel?> loginFunc() async {
    if (loginFormKey.currentState!.validate()) {
      model = await authAPIController.loginFunc(
        email: emailTextEditingControllerForLogin.text,
        password: passwordTextEditingControllerForLogin.text,
      );
      if (model != null) {
        Constants.navigateTo('/home', pushAndRemoveUntil: true);
        return model;
      }
      return null;
    }
    return null;
  }
}
