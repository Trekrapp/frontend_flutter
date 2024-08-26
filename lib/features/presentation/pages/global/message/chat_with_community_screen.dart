import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../widgets/message/widgets_imports.dart';

class ChatWithCommunityScreen extends StatelessWidget {
  const ChatWithCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.magnolia),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.artyClickWarmRed,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nomadia",
              style: GoogleFonts.abel(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            Text(
              "4,412 Membres",
              style: GoogleFonts.abel(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.magnolia),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: const Icon(
                  Icons.person_add_alt_sharp,
                  color: AppColors.mistBlue,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: const SendMessageBottomSection()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: HelperFunctions.screenHeight(context).h - 60.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAssets.background))),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundImage: const AssetImage(AppAssets.avatar1),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const BubbleCommunityMessage()
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundImage: const AssetImage(AppAssets.avatar1),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const BubbleCommunityMessage()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
