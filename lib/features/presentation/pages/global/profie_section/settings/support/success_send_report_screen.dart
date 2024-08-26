import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';
import 'package:trekr_second/core/constants/app_colors.dart';

import '../../../../../widgets/global/widgets_imports.dart';

class SuccessSendReportScreen extends StatelessWidget {
  const SuccessSendReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Signaler un problème"),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(AppAssets.successOperation)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Merci, nous vous contacterons bientôt",
                style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      )),
    );
  }
}
