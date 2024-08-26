import 'package:flutter/material.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateToAuth() {
    Future.delayed(const Duration(seconds: 5),
        () => Navigator.pushNamed(context, NavigationStrings.auth));
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
