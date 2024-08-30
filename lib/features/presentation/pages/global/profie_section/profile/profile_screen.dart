import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';

import '../../../../widgets/profile_section/profile/widgets_imports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = <Tab>[
    const Tab(text: 'Posts'),
    const Tab(text: 'Reels'),
  ];
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300.h,
                    ),
                    Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          AppAssets.profile,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200.h,
                      left: -35.w,
                      child: Image.asset(AppAssets.travel2),
                    ),
                    Positioned(
                      top: 220.h,
                      right: -25.w,
                      child: Image.asset(AppAssets.bag),
                    ),
                    Positioned(
                      top: 30.h,
                      left: 16.w,
                      child: Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.secondaryColor,
                              )),
                          child: const Center(
                              child: Icon(
                            Icons.arrow_back,
                            color: AppColors.secondaryColor,
                          ))),
                    ),
                    Positioned(
                      top: 30.h,
                      right: 16.w,
                      child: IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: AppColors.secondaryColor,
                        ),
                        onPressed: () => Navigator.pushNamed(
                            context, NavigationStrings.settings),
                      ),
                    ),
                    Positioned(
                      top: 105.h,
                      left: 5.w,
                      right: 0,
                      child: Image.asset(AppAssets.wave),
                    ),
                    Positioned(
                      top: 140.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(AppAssets.ellipse),
                      ),
                    ),
                    Positioned(
                      top: 150.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: CircleAvatar(
                          radius: 56.r,
                          backgroundImage: const AssetImage(AppAssets
                              .nature), // Replace with your avatar image
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Melissa Peters',
                  style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                Text(
                  'Interior Designer',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: AppColors.liver,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.liver,
                    ),
                    Text(
                      'Lagos, Nigeria',
                      style: GoogleFonts.lato(
                        fontSize: 14.sp,
                        color: AppColors.liver,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StatisticItem(
                      count: '122',
                      label: 'followers',
                    ),
                    StatisticItem(
                      count: '67',
                      label: 'following',
                    ),
                    StatisticItem(
                      count: '37K',
                      label: 'likes',
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ManagementProfileButton(
                      textButton: "Modifier",
                      onPressed: () => Navigator.pushNamed(
                          context, NavigationStrings.editProfile),
                    ),
                    SizedBox(width: 16.w),
                    ManagementProfileButton(
                      textButton: "Partager",
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TabBar(
                    tabs: tabs,
                    controller: _tabController,
                  ),
                ),
                SizedBox(
                  height: HelperFunctions.screenHeight(context) * .6.h,
                  width: HelperFunctions.screenWidth(context),
                  child: TabBarView(
                      controller: _tabController,
                      //physics: const BouncingScrollPhysics(),
                      children: const [
                        GridViewPostsAndReels(),
                        GridViewPostsAndReels()
                      ]),
                )
              ])),
        );
      }),
    );
  }
}
