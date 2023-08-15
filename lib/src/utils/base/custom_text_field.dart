import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:start_tech_test/src/utils/consts.dart';
import 'package:start_tech_test/src/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText, labelText, errorText, helperText;
  final Color? cursorColor, hintColor, containerColor, labelColor;
  final Widget? suffixIcon, prefixIcon;
  final bool obscureText, addCountryPicker, showCountryOnly, hideMainText;
  final EdgeInsetsGeometry screenPadding, contentPadding;
  final EdgeInsetsGeometry? contentPaddingForTextField;
  final TextEditingController controller;
  final double raduis;
  final void Function(String)? onFieldSubmitted;
  final BoxBorder? border;
  final TextStyle? style;
  final bool readOnly;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final StringBuffer? holdUpValue;
  final bool isTextArea;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  const CustomTextField(
      {super.key,
      required this.controller,
      this.holdUpValue,
      this.helperText,
      this.hintText,
      this.obscureText = false,
      this.onFieldSubmitted,
      this.addCountryPicker = false,
      this.screenPadding = const EdgeInsets.symmetric(horizontal: 80),
      this.contentPadding = const EdgeInsets.symmetric(horizontal: 10),
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.contentPaddingForTextField,
      this.style,
      this.prefixIcon,
      this.labelColor,
      this.suffixIcon,
      this.containerColor = Colors.white,
      this.raduis = 10,
      this.labelText,
      this.readOnly = false,
      this.isTextArea = false,
      this.border,
      this.keyboardType,
      this.onTap,
      this.validator,
      this.onChanged,
      this.errorText,
      this.hideMainText = false,
      this.showCountryOnly = false,
      this.cursorColor = Colors.black,
      this.hintColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      autovalidateMode: autovalidateMode,
      validator: validator,
      onTapOutside: (PointerDownEvent? event) {
        return Constants.unFocusFunc();
      },
      keyboardType: keyboardType,
      maxLines: isTextArea ? 5 : 1,
      onTap: onTap,
      readOnly: readOnly,
      style: style,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      controller: controller,
      cursorColor: cursorColor,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        helperMaxLines: 5,
        helperText: helperText,
        //helperStyle: const TextStyle(color: Color(0xFF6878C6)),
        errorText: errorText,
        filled: true,
        fillColor: containerColor,
        enabled: true,
        contentPadding: contentPadding,
        labelText: labelText,
        suffixIcon: suffixIcon,
        prefixIcon: addCountryPicker
            ? CountryCodePicker(
                padding: EdgeInsets.zero,
                initialSelection: 'AE',
                showCountryOnly: showCountryOnly,
                hideMainText: true,
                onInit: (CountryCode? v) {
                  holdUpValue?.clear();
                  WidgetsBinding.instance.addPostFrameCallback(
                      (_) => holdUpValue?.write(v!.dialCode!));
                },
                onChanged: (CountryCode v) {
                  controller.clear();
                  holdUpValue?.clear();
                  holdUpValue?.write(v.dialCode!);
                },
              )
            : prefixIcon,
        labelStyle: TextStyle(
          color: labelColor,
          fontFamily: 'AlexandriaFLF',
        ),
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 16,
          fontFamily: 'AlexandriaFLF',
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,

        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.5,
            color: Color(0xFFE0E0E0),
          ),
          borderRadius: BorderRadius.circular(raduis),
        ),
      ),
    ).addPadding(context, edgeInsetsGeometry: screenPadding);
  }
}
