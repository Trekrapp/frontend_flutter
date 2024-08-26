import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  navigateToAuth() {
    Future.delayed(const Duration(seconds: 5),
        () => Navigator.pushNamed(context, NavigationStrings.main));
  }

  @override
  void initState() {
    navigateToAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: HelperFunctions.screenHeight(context),
        width: HelperFunctions.screenWidth(context),
        color: AppColors.primaryColor,
        child: Center(
          child: Text(
            "Trekr",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      )),
    );
  }
}
