import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
mixin Constants {
  static String devBaseURL = 'https://whatsupdoctor.onrender.com/';

  static void unFocusFunc() {
    return FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<void> get showLoading async {
    return Get.dialog(const Center(child: CircularProgressIndicator()));
  }

  static void get hideLoadingOrNavBack => Get.back();

  static Future<void> navigateTo(
    Widget screen, {
    bool pushReplacment = false,
    bool pushAndRemoveUntil = false,
  }) async =>
      pushReplacment
          ? Get.off(
              screen,
            )
          : pushAndRemoveUntil
              ? Get.offAll(
                  screen,
                )
              : Get.to(
                  screen,
                );

  static Future<dynamic> dialogMessage(
      {DialogType dialogType = DialogType.error,
      String? title,
      String? description,
      String? okButtonName,
      String? cancelButtonName,
      Function? onOkPressed,
      Function? onCancelPressed,
      bool barrierDismissible = true,
      bool removeCancelButton = true}) async {
    return AwesomeDialog(
      context: Get.context!,
      dialogType: dialogType,
      title: title ?? 'Error',
      desc: description ?? 'Something went wrong',
      btnCancelOnPress: removeCancelButton
          ? null
          : () {
              if (onCancelPressed != null) {
                onCancelPressed();
              }
              hideLoadingOrNavBack;
            },
      btnOkOnPress: () {
        if (onOkPressed != null) {
          onOkPressed();
        }
        hideLoadingOrNavBack;
      },
    )..show();
  }
}