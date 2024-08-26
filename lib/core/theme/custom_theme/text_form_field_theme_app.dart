import 'package:flutter/material.dart';
import 'package:trekr_second/core/constants/app_colors.dart';

import '../../constants/app_sizes.dart';

class TextFormFieldThemeApp {
  TextFormFieldThemeApp._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
    filled: true,
    fillColor: AppColors.greenWhite,
    hintStyle: const TextStyle().copyWith(
        fontSize: 17,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w500),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusExtraLg),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusExtraLg),
      borderSide: const BorderSide(width: 1, color: AppColors.greenWhite),
    ), // Default border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusExtraLg),
      borderSide: const BorderSide(width: 1, color: AppColors.greenWhite),
      // Focused border color
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusExtraLg),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
  );
}
