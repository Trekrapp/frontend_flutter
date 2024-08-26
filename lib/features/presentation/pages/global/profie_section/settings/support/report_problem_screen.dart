import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/features/presentation/widgets/profile_section/settings/widgets_imports.dart';

import '../../../../../widgets/global/widgets_imports.dart';

class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Support et Aide"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Column(
          children: [
            TextFieldSupport(
                hintText: "Planifiez votre voyage Maintenant",
                labelText: "Signaler un problème"),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: PrimaryButton(
                text: "Signaler un problème",
                onPressed: () => Navigator.pushNamed(
                    context, NavigationStrings.successOperation),
                backgroundColor: AppColors.secondaryColor,
              ),
            )
          ],
        ),
      )),
    );
  }
}
