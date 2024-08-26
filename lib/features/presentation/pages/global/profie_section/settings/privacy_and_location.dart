import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trekr_second/features/presentation/widgets/profile_section/settings/widgets_imports.dart';

import '../../../../widgets/global/widgets_imports.dart';

class PrivacyAndLocation extends StatelessWidget {
  const PrivacyAndLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Confidentialité et Localisation"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            const SwitchItem(title: "Compte privé"),
            SizedBox(
              height: 5.h,
            ),
            const SwitchItem(title: "Partager ma localisation"),
          ],
        ),
      )),
    );
  }
}
