import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/features/presentation/widgets/global/widgets_imports.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../widgets/plan_trip/widgets_imports.dart';

class PlanTripScreen extends StatefulWidget {
  const PlanTripScreen({super.key});

  @override
  State<PlanTripScreen> createState() => _PlanTripScreenState();
}

class _PlanTripScreenState extends State<PlanTripScreen> {
  String selectedCategory = 'Solo';

  final List<Map<String, String>> categories = [
    {'name': 'Solo', 'icon': AppAssets.solo},
    {'name': 'Famille', 'icon': AppAssets.family},
    {'name': 'Luxe', 'icon': AppAssets.luxe},
    {'name': 'Culturel', 'icon': AppAssets.culture},
  ];

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Planifiez Votre Voyage",
            style: GoogleFonts.nunito(
                fontSize: 22.sp, color: AppColors.secondaryColor),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
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
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () => onCategorySelected(category['name']!),
                    child: Column(
                      children: [
                        Image.asset(category['icon']!, height: 50),
                        if (selectedCategory != category['name'])
                          Text(
                            category['name']!,
                            style: GoogleFonts.inter(
                                fontSize: 13.sp, color: AppColors.primaryColor),
                          ),
                        if (selectedCategory == category['name'])
                          Container(
                            margin: const EdgeInsets.only(top: 4.0),
                            height: 25.h,
                            width: 60.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color:
                                    AppColors.secondaryColor.withOpacity(0.46)),
                            child: Center(
                              child: Text(
                                category['name']!,
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const TextFieldPlanTrip(
                      hintText: "Jan 5 - Jan 7", labelText: "Date"),
                  const SizedBox(height: 15),
                  const TextFieldPlanTrip(
                      hintText: "Paris, France", labelText: "Localisation"),
                  const SizedBox(height: 15),
                  const TextFieldPlanTrip(
                      hintText: "Islande", labelText: "Prochaine destination"),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Expanded(
                        child: TextFieldPlanTrip(
                            hintText: "1", labelText: "Nombre d'adultes"),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFieldPlanTrip(
                            hintText: "1", labelText: "Nombre d'enfants"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const TextFieldPlanTrip(
                      hintText: "10000", labelText: "Budget"),
                  const SizedBox(height: 15),
                  const TextFieldPlanTrip(
                      maxLines: 7,
                      hintText:
                          "Have to take permission before to night stay. Call buddies before and get confirmation from them.",
                      labelText: "Remarque"),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    text: "Planifiez votre voyage Maintenant",
                    onPressed: () => Navigator.pushNamed(
                        context, NavigationStrings.resultPlanTrip),
                    backgroundColor: AppColors.secondaryColor,
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
