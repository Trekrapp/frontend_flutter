import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/core/utils/helpers/validation.dart';
import 'package:trekr_second/features/presentation/cubit/user/forgot_password/forgot_password_cubit.dart';
import 'package:trekr_second/features/presentation/widgets/global/widgets_imports.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Mot de passe oublié ",
                    style: GoogleFonts.abhayaLibre(
                        fontSize: 24.sp, color: AppColors.artyClickWarmRed),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Veuillez entrer votre email pour réinitialiser le mot de passe",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14.sp, color: AppColors.primaryColor),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          "Email",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14.sp, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: SizedBox(
                      child: TextFormField(
                        controller: emailController,
                        validator: Validators.emailValidator,
                        decoration: const InputDecoration(
                          hintText: 'Entrer votre Email',
                        ),
                      ),
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
                          text: "Réinitialiser le mot de passe",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<ForgotPasswordCubit>(context)
                                  .forgotPassword(email: emailController.text)
                                  .whenComplete(() {
                                Navigator.pushNamed(
                                    context, NavigationStrings.verifyCode,
                                    arguments: emailController.text);
                              });
                            }
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Image.asset(AppAssets.path1)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
