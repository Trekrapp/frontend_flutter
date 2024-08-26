import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';

import '../../../../core/constants/app_colors.dart';

class SuccessCreationPasswordScreen extends StatelessWidget {
  const SuccessCreationPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.artyClickWarmRed,
            )),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.check,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Le mot de passe a été réinitialisé avec succès",
            textAlign: TextAlign.center,
            style: GoogleFonts.abhayaLibre(
                fontSize: 24.sp, color: AppColors.primaryColor),
          )
        ],
      )),
    );
  }
}
