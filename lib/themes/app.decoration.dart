import 'package:demo/themes/app.theme.dart';
import 'package:demo/utils/constants/app.dimensions.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static InputBorder inputOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimension.kRadius),
      borderSide: const BorderSide(
        color: AppTheme.themeBorderColor,
      ),
    );
  }

  static InputBorder errorOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimension.kRadius),
      borderSide: const BorderSide(
        color: AppTheme.themeErrorColor,
      ),
    );
  }

  static InputDecoration textFieldDecoration(
      {String? hintText,
      String? labelText,
      String? errorText,
      bool error = false}) {
    return InputDecoration(
      labelText: labelText,
      errorText: errorText,
      hintText: hintText,
      border: inputOutlineBorder(),
      disabledBorder: inputOutlineBorder(),
      enabledBorder: inputOutlineBorder(),
      errorBorder: errorOutlineBorder(),
      focusedBorder: inputOutlineBorder(),
      focusedErrorBorder: errorOutlineBorder(),
      contentPadding: const EdgeInsets.only(
          left: AppDimension.kPadding,
          right: AppDimension.kPadding,
          top: 0,
          bottom: 0),
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.themeTextColor,
      ),
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppTheme.themeTextColor,
      ),
      alignLabelWithHint: false,
      // isDense: true,
    );
  }
}
