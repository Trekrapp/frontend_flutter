import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/routes/routes.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../widgets/home/widgets_imports.dart';
import '../../../widgets/join_community/widgets_imports.dart';
import '../../../widgets/profile_section/profile/widgets_imports.dart';

class JoinCommunityScreen extends StatelessWidget {
  const JoinCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softPeach,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.artyClickWarmRed,
          ),
        ),
        centerTitle: true,
        title: Text("Communauté",
            style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.artyClickWarmRed)),
        backgroundColor: AppColors.softPeach,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.community,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ManagementProfileButton(
                      textButton: "Créer",
                      onPressed: () {},
                    ),
                    SizedBox(width: 16.w),
                    ManagementProfileButton(
                      textButton: "Chat en direct",
                      onPressed: () => Navigator.pushNamed(
                          context, NavigationStrings.chatWithCommunity),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                SecondaryTitle(title: "Pour  vous", onPressed: () {}),
                SizedBox(
                  height: 15.h,
                ),
                CommunityNetwork(),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mes dernières communautés",
                        style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 45.r,
                            backgroundImage: AssetImage(AppAssets.avatar),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                LatestCommunity()
              ],
            ),
          )
        ],
      ),
    );
  }
}
