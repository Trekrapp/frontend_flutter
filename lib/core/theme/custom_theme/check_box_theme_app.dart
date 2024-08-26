import 'package:flutter/material.dart';
import 'package:trekr_second/core/constants/app_colors.dart';

class CheckBoxThemeApp {
  CheckBoxThemeApp._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    side: const BorderSide(color: AppColors.languidLavender, width: 1.2),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.white;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.white;
      }
    }),
  );
}
