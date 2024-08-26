import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_colors.dart';

class TextThemeApp {
  TextThemeApp._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryColor),
    headlineMedium: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),

    titleLarge: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor),
    titleMedium: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
    //Body
    bodyLarge: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    bodyMedium: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(0.5)),
    //Label
    labelLarge: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: GoogleFonts.abhayaLibre().copyWith(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: GoogleFonts.poppins().copyWith(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
    //Title
    titleLarge: GoogleFonts.poppins().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: GoogleFonts.poppins().copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: GoogleFonts.poppins().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
    //Body
    bodyLarge: GoogleFonts.poppins().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: GoogleFonts.poppins().copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: GoogleFonts.poppins().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white.withOpacity(0.5)),
    //Label
    labelLarge: GoogleFonts.poppins().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: GoogleFonts.poppins().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5)),
  );
}
