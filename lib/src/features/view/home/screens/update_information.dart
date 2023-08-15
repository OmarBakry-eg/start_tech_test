import 'package:flutter/material.dart';
import 'package:start_tech_test/src/utils/base/custom_button.dart';
import 'package:start_tech_test/src/utils/base/custom_text_field.dart';
import 'package:start_tech_test/src/utils/base/custom_text_widget.dart';
import 'package:start_tech_test/src/utils/helpers/form_validation.dart';

class UpdateInformationPage extends StatelessWidget {
  const UpdateInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    StringBuffer holdUpValue = StringBuffer();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 67,
        backgroundColor: const Color.fromARGB(255, 46, 12, 52),
        title: const CustomTextWidget(
          title: 'Update Information',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                CustomTextField(
                  validator: FormValidator.generalEmptyValidator,
                  screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                  hintText: 'Full Name',
                  hintColor: const Color(0xFFABABAB),
                  border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                  controller: TextEditingController(),
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
                  border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                  controller: TextEditingController(),
                  addCountryPicker: true,
                  holdUpValue: holdUpValue,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  validator: FormValidator.emailOrPhoneValidator,
                  screenPadding: const EdgeInsets.symmetric(horizontal: 95),
                  hintText: 'Email Address',
                  hintColor: const Color(0xFFABABAB),
                  border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                  controller: TextEditingController(),
                ),
                const SizedBox(
                  height: 26,
                ),
                CustomButton(
                  onTap: () {},
                  title: 'Save',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
