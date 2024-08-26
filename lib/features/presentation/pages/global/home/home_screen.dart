import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';

import '../../../../../core/routes/routes.dart';
import '../../../cubit/search/search/search_posts_users_cubit.dart';
import '../../../widgets/global/widgets_imports.dart';
import '../../../widgets/home/widgets_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    context.read<SearchPostsUsersCubit>().searchPostsAndUsers(query: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.pathHeart),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearch,
                    decoration: InputDecoration(
                      hintText: "Rechercher",
                      hintStyle: GoogleFonts.inter(
                          color: AppColors.primaryColor, fontSize: 13.sp),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                        size: 25.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchPostsUsersCubit, SearchPostsUsersState>(
                builder: (context, state) {
                  if (state is SearchPostsUsersLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SearchPostsUsersFailure) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else if (state is SearchPostsUsersLoaded) {
                    final results = state.results;
                    return ListView(
                      children: [
                        // Display users
                        if (results.users!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  "Users",
                                  style: GoogleFonts.inter(
                                    color: AppColors.primaryColor,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              ...results.users!.map((user) => ListTile(
                                    title: Text(user.username!),
                                    subtitle: Text(user.email!),
                                    onTap: () {
                                      // Handle user tap
                                    },
                                  )),
                            ],
                          ),
                        // Display posts
                        if (results.posts!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  "Posts",
                                  style: GoogleFonts.inter(
                                    color: AppColors.primaryColor,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              ...results.posts!.map((post) => ListTile(
                                    title: Text(post.content!),
                                    subtitle: Text(post.createdAt.toString()),
                                    leading: post.mediaUrls!.isNotEmpty
                                        ? Image.network(
                                            "http://213.130.144.203:8084/files/${post.mediaUrls!.first.url!}")
                                        : null,
                                    onTap: () {
                                      // Handle post tap
                                    },
                                  )),
                            ],
                          ),
                      ],
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Catégories",
                                style: GoogleFonts.inter(
                                    color: AppColors.primaryColor,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "Voir plus",
                                style: GoogleFonts.inter(
                                    color: AppColors.osloGrey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          width: HelperFunctions.screenWidth(context),
                          height: 113.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 113.h,
                                  width: 89.w,
                                  margin: EdgeInsets.only(left: 15.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(AppAssets.nature))),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Stack(
                          children: [
                            PrimaryTitle(
                                title: "Planifions votre voyage ensemble",
                                description:
                                    "Laissez-nous planner : Ajoutez vos infos, définissez votre budget, et nous élaborerons votre itinéraire sur mesure.",
                                onPressed: () => Navigator.pushNamed(
                                    context, NavigationStrings.planTrip)),
                            Positioned(
                                right: -24.w,
                                top: 32.h,
                                child: SizedBox(
                                  height: 80.h,
                                  width: 96.w,
                                  child: const Image(
                                      image: AssetImage(AppAssets.travel)),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CategoryItem(
                              borderColor: AppColors.primaryColor,
                              icon: CupertinoIcons.group,
                              title: "Infos Perso",
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            const CategoryItem(
                              borderColor: AppColors.lightSalmon,
                              icon: Icons.percent,
                              title: "Budget",
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            const CategoryItem(
                              borderColor: AppColors.artyClickWarmRed,
                              icon: Icons.calculate_outlined,
                              title: "Planner",
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: HelperFunctions.screenWidth(context).w,
                              height:
                                  HelperFunctions.screenHeight(context) * .11.h,
                            ),
                            Positioned(
                                left: -45.w,
                                top: -5.h,
                                child: SizedBox(
                                  height: 80.h,
                                  width: 96.w,
                                  child: const Image(
                                      image: AssetImage(AppAssets.bag)),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SecondaryTitle(
                            title: 'Destinations Préférées', onPressed: () {}),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: HelperFunctions.screenHeight(context) * .2.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      width:
                                          HelperFunctions.screenWidth(context) *
                                              .45.w,
                                      margin: EdgeInsets.only(left: 10.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white,
                                                blurRadius: 10,
                                                spreadRadius: 10,
                                                offset: Offset(0, 1))
                                          ],
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(AppAssets.nature),
                                              fit: BoxFit.cover)),
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 10.w,
                                        right: 0,
                                        bottom: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                        )),
                                    Positioned(
                                        bottom: 10.h,
                                        left: 20.w,
                                        right: 10.w,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            color: AppColors.gainsboro
                                                .withOpacity(0.44),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 8.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Eiffel Tower",
                                                      style: GoogleFonts.inter(
                                                          fontSize: 12.sp,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color: Colors.white,
                                                          size: 12.sp,
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Text(
                                                          "Paris, France",
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize:
                                                                      10.sp,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.favorite,
                                                  color: AppColors
                                                      .artyClickWarmRed,
                                                  size: 15.sp,
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                );
                              }),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        PrimaryTitle(
                            title: "Rencontrez de Nouveaux Amis",
                            description:
                                "Découvrez des gens proches de vous, rencontrez de nouveaux amis, et partagez des moments mémorables ensemble.",
                            onPressed: () => Navigator.pushNamed(
                                context, NavigationStrings.friendsDiscover)),
                        SizedBox(
                          height: 20.h,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height:
                                  HelperFunctions.screenHeight(context) * .31,
                              width: HelperFunctions.screenWidth(context).w,
                            ),
                            Positioned(
                                top: 0.h,
                                left: 15.w,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 200,
                                      width:
                                          HelperFunctions.screenWidth(context) *
                                              .8.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          color: AppColors.primaryColor),
                                    ),
                                  ],
                                )),
                            Positioned(
                              top: 20.h,
                              right: 20.w,
                              child: Image.asset(AppAssets.locationGif),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Stack(
                          children: [
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "Vous êtes ",
                                  style: GoogleFonts.abhayaLibre(
                                      fontSize: 46.sp,
                                      color: AppColors.primaryColor)),
                              TextSpan(
                                  text: "Unique",
                                  style: GoogleFonts.abhayaLibre(
                                      fontSize: 46.sp,
                                      color: AppColors.secondaryColor)),
                            ])),
                            Positioned(
                                bottom: 0.h,
                                left: 65.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Unique. Inclusif. Personnalisé.",
                                      style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 256.h,
                          width: HelperFunctions.screenWidth(context),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppAssets.social),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: PrimaryButton(
                            text: "Explorez maintenant",
                            onPressed: () {},
                            backgroundColor: AppColors.secondaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SecondaryTitle(
                            title: "Explorez leurs Voyages", onPressed: () {}),
                        SizedBox(
                          height: 10.h,
                        ),
                        FeedItem()
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
