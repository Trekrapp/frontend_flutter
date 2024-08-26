import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/features/presentation/widgets/global/widgets_imports.dart';
import 'package:trekr_second/features/presentation/widgets/profile_section/settings/widgets_imports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Paramètres"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Paramètres du Compte",
              style: GoogleFonts.inter(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            const SettingsItem(
                icon: Icons.person_2_outlined, title: "Profil et Identité"),
            SizedBox(
              height: 10.h,
            ),
            SettingsItem(
              icon: Icons.lock_outline_rounded,
              title: "Confidentialité et Localisation",
              onPressed: () => Navigator.pushNamed(
                  context, NavigationStrings.privacyAndLocation),
            ),
            SizedBox(
              height: 10.h,
            ),
            SettingsItem(
              icon: Icons.notifications,
              title: "Notifications",
              onPressed: () =>
                  Navigator.pushNamed(context, NavigationStrings.notifications),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Préférences et Personnalisation",
              style: GoogleFonts.inter(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            SettingsItem(
              icon: Icons.translate,
              title: "Langue",
              onPressed: () =>
                  Navigator.pushNamed(context, NavigationStrings.language),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Gestion des Données",
              style: GoogleFonts.inter(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            SettingsItem(
              icon: Icons.delete_outline,
              title: "Effacer le cache",
              onPressed: () =>
                  Navigator.pushNamed(context, NavigationStrings.clearCache),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Assistance et Légalité",
              style: GoogleFonts.inter(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40.h,
            ),
            SettingsItem(
              icon: Icons.error_outline,
              title: "Support et Aide",
              onPressed: () =>
                  Navigator.pushNamed(context, NavigationStrings.supportHelp),
            ),
            SizedBox(
              height: 10.h,
            ),
            const SettingsItem(
                icon: Icons.perm_device_info_outlined,
                title: "Sécurité et Conformité"),
            SizedBox(
              height: 10.h,
            ),
            const SettingsItem(icon: Icons.logout, title: "Déconnexion"),
          ],
        ),
      )),
    );
  }
}
