import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'package:trekr_second/core/routes/routes.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../widgets/global/widgets_imports.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;
  const VerifyCodeScreen({super.key, required this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController textEditingController = TextEditingController(text: "");
  int _otpCodeLength = 4;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String image = AppAssets.path3;
  final intRegex = RegExp(r'\d+', multiLine: true);
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        image = AppAssets.path1;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode() {
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        _isLoadingButton = false;
        _enableButton = false;
      });
    });
  }

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
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nous avons envoyé un lien de réinitialisation à ${widget.email}, entrez le code à 5 chiffres mentionné dans l'e-mail.",
                        style: GoogleFonts.abhayaLibre(
                            fontSize: 14.sp, color: AppColors.primaryColor),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFieldPin(
                          textController: textEditingController,
                          autoFocus: true,
                          codeLength: 6,
                          alignment: MainAxisAlignment.center,
                          defaultBoxSize: 46.0,
                          margin: 5,
                          selectedBoxSize: 46.0,
                          textStyle: const TextStyle(fontSize: 16),
                          defaultDecoration: _pinPutDecoration.copyWith(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
                          selectedDecoration: _pinPutDecoration,
                          onChange: (code) {
                            _onOtpCallBack(code, false);
                          }),
                    ],
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
                        text: "Vérifier le code",
                        onPressed: () {
                          setState(() {
                            image = AppAssets.path1;
                            _enableButton = false;
                          });
                          Navigator.pushNamed(context,
                              NavigationStrings.confirmVerificationCode,
                              arguments: textEditingController.text);
                          print(
                              'this is verification code ${textEditingController.text}');
                        }),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        text: "Vous n'avez pas encore reçu l'e-mail ? ",
                        style: GoogleFonts.abhayaLibre(
                            fontSize: 16.sp, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "\nRé-envoyer l'email",
                              style: GoogleFonts.abhayaLibre(
                                  fontSize: 16.sp,
                                  color: AppColors.artyClickWarmRed))
                        ])),
                SizedBox(
                  height: 40.h,
                ),
                Image.asset(image)
              ],
            ),
          )
        ],
      ),
    );
  }
}
