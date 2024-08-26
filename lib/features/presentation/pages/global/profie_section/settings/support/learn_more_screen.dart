import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../widgets/global/widgets_imports.dart';

class LearnMoreScreen extends StatelessWidget {
  const LearnMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "En Savoir plus sur Trekr"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "À Propos de Trekr",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Bienvenue sur la page En savoir plus sur Trekr. Nous sommes ravis de vous présenter notre application dédiée au voyage social.",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Notre Mission",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Chez Trekr, notre mission est de connecter les voyageurs du monde entier, de faciliter la découverte de nouvelles destinations et de favoriser des expériences authentiques et enrichissantes.",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Fonctionnalités Principales",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Création de Profil : Partagez vos intérêts de voyage et créez votre profil unique.\nPlanification de Voyages : Organisez vos aventures et découvrez les itinéraires recommandés par d'autres utilisateurs.\nPartage de Conseils : Échangez des conseils et des recommandations avec une communauté de voyageurs passionnés.\nRencontres : Rencontrez d'autres voyageurs partageant les mêmes centres d'intérêt et créez des liens durables.",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Confidentialité et Sécurité",
                style: GoogleFonts.nunito(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "La confidentialité et la sécurité de nos utilisateurs sont notre priorité absolue. Nous mettons en œuvre des mesures de protection des données pour garantir une expérience sécurisée et agréable à chaque utilisateur de Trekr.Contactez-NousSi vous avez des questions ou des commentaires sur Trekr, n'hésitez pas à nous contacter. Nous sommes là pour vous aider et pour rendre votre expérience de voyage aussi exceptionnelle que possible.Merci d'avoir choisi Trekr pour vos aventures de voyage !",
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
