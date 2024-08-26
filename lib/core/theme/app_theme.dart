import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'custom_theme/app_bar_theme.dart';
import 'custom_theme/check_box_theme_app.dart';
import 'custom_theme/text_form_field_theme_app.dart';
import 'custom_theme/text_theme_app.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextThemeApp.lightTextTheme,
      checkboxTheme: CheckBoxThemeApp.lightCheckBoxTheme,
      inputDecorationTheme: TextFormFieldThemeApp.lightInputDecorationTheme,
      appBarTheme: AppBarThemeOfApp.lightAppBarTheme);
}
