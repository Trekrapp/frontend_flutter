import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/core/utils/helpers/validation.dart';
import 'package:trekr_second/features/presentation/cubit/user/create_new_password/create_new_password_cubit.dart';

import '../../../../core/constants/app_colors.dart';
import '../../widgets/global/widgets_imports.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final String verificationCode;
  const CreateNewPasswordScreen({super.key, required this.verificationCode});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isShow = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Crée un nouveau mot de passe. Assurez-vous qu'il diffère de les précédents pour la sécurité",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14.sp, color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Mot de passe",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14.sp, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          child: TextFormField(
                            controller: passwordController,
                            validator: Validators.passwordValidator,
                            obscureText: isShow == false ? true : false,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isShow = !isShow;
                                    });
                                  },
                                  icon: Icon(
                                    isShow == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.primaryColor,
                                  )),
                              hintText: 'Entrez votre nouveau mot de passe',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Confirmez le mot de passe",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 14.sp, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          child: TextFormField(
                            obscureText: isShow == false ? true : false,
                            controller: confirmPasswordController,
                            validator: (value) => Validators.confirmPassword(
                                value, passwordController.text),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isShow = !isShow;
                                    });
                                  },
                                  child: Icon(
                                    isShow == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.primaryColor,
                                  )),
                              hintText: 'Entrez à nouveau le mot de passe',
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
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    BlocProvider.of<CreateNewPasswordCubit>(
                                            context)
                                        .resetPassword(
                                            token: widget.verificationCode,
                                            newPassword:
                                                confirmPasswordController.text)
                                        .whenComplete(() {
                                      Navigator.pushNamed(
                                          context,
                                          NavigationStrings
                                              .successCreationPassword);
                                    });
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
