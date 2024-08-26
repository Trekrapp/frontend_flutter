import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trekr_second/core/routes/routes.dart';

import '../../../../../widgets/global/widgets_imports.dart';
import '../../../../../widgets/profile_section/settings/widgets_imports.dart';

class SupportAndHelpScreen extends StatelessWidget {
  const SupportAndHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Support et Aide"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          children: [
            SupportItem(
              title: 'Signaler un problème',
              onPressed: () =>
                  Navigator.pushNamed(context, NavigationStrings.reportProblem),
            ),
            SupportItem(
              title: 'Besoin d’aide',
              onPressed: () =>
                  Navigator.pushNamed(context, NavigationStrings.needHelp),
            ),
            SupportItem(
              title: 'Termes et conditions',
              onPressed: () => Navigator.pushNamed(
                  context, NavigationStrings.termsConditions),
            ),
            SupportItem(
              title: 'En Savoir plus sur Trekr',
              onPressed: () =>
                  Navigator.pushNamed(context, NavigationStrings.learnMore),
            ),
          ],
        ),
      )),
    );
  }
}
