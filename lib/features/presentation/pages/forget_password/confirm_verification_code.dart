import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../widgets/global/widgets_imports.dart';

class ConfirmVerificationCode extends StatelessWidget {
  final String verificationCode;
  const ConfirmVerificationCode({super.key, required this.verificationCode});

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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  "Mot de passe oublié ",
                  style: GoogleFonts.abhayaLibre(
                      fontSize: 24.sp, color: AppColors.artyClickWarmRed),
                ),
                SizedBox(
                  height: HelperFunctions.screenHeight(context) * .2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Votre mot de passe a été réinitialisé avec succès. Cliquez sur confirmer pour définir un nouveau mot de passe",
                        style: GoogleFonts.abhayaLibre(
                            fontSize: 14.sp, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    height: 48.h,
                    child: PrimaryButton(
                        text: "Confirmer",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, NavigationStrings.newPassword,
                              arguments: verificationCode);

                          print("verification code $verificationCode");
                        }),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Image.asset(AppAssets.path2)
              ],
            ),
          )
        ],
      ),
    );
  }
}
