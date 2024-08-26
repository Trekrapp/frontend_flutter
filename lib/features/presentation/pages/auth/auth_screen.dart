import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/features/presentation/widgets/auth/widgets_imports.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../widgets/auth/sliver_persistent_header.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: false,
              delegate: SliverAppBarDelegate(
                minHeight: 120,
                maxHeight: 60,
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor:
                                _isLogin ? Colors.white : Colors.black,
                            backgroundColor: _isLogin
                                ? AppColors.secondaryColor
                                : Colors.white,
                            elevation: 0),
                        onPressed: () {
                          setState(() {
                            _isLogin = true;
                          });
                        },
                        child: Text(
                          'Se connecter',
                          style: TextStyle(
                              fontSize: 20.sp, color: AppColors.primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor:
                                !_isLogin ? Colors.white : Colors.black,
                            backgroundColor: !_isLogin
                                ? AppColors.secondaryColor
                                : Colors.white,
                            minimumSize: Size(
                                HelperFunctions.screenWidth(context) * .4.w,
                                40.h)),
                        onPressed: () {
                          setState(() {
                            _isLogin = false;
                          });
                        },
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                              color: _isLogin
                                  ? AppColors.secondaryColor
                                  : AppColors.primaryColor,
                              fontSize: 20.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    _isLogin
                        ? Text(
                            "Votre Compagnon de Voyage",
                            style: GoogleFonts.abhayaLibre(
                              fontSize: 22.sp,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: _isLogin ? 40.h : 0.h,
                    ),
                    _isLogin ? LoginForm() : SignupForm(),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
