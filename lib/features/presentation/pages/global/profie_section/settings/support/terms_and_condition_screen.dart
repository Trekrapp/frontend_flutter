import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_colors.dart';

import '../../../../../widgets/global/widgets_imports.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Besoin d'aide"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Conditions Générales d'Utilisation",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Bienvenue sur Trekr ! Les présentes conditions régissent l'utilisation de l'application mobile Trekr. En accédant à cette application, nous supposons que vous acceptez ces conditions générales. N'utilisez pas Trekr si vous n'acceptez pas toutes les conditions générales énoncées sur cette page.",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Licence",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sauf indication contraire, Trekr et/ou ses concédants détiennent les droits de propriété intellectuelle pour tout le contenu de l'application Trekr. Tous les droits de propriété intellectuelle sont réservés. Vous pouvez accéder à cette application à des fins personnelles, sous réserve des restrictions énoncées dans ces conditions générales d'utilisation.",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Restrictions",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Vous êtes spécifiquement limité à tout ce qui suit :\n Publier tout contenu de Trekr dans un autre média.\nVendre, sous-licencier et/ou commercialiser de quelque manière que ce soit tout contenu de Trekr.\nUtiliser Trekr de manière à nuire à l'application.\nUtiliser Trekr de manière à affecter l'accès des utilisateurs à l'application.\nS'engager dans toute activité de collecte de données,",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
