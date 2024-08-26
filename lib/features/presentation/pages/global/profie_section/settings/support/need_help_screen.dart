import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../widgets/global/widgets_imports.dart';
import '../../../../../widgets/profile_section/settings/widgets_imports.dart';

class NeedHelpScreen extends StatelessWidget {
  const NeedHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Besoin d'aide"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Column(
          children: [
            const TextFieldSupport(
                hintText: "Besoin d'aide ? N'hésitez pas à nous contacter",
                labelText: "Besoin d'aide "),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: PrimaryButton(
                text: "Besoin d'aide",
                onPressed: () {},
                backgroundColor: AppColors.secondaryColor,
              ),
            )
          ],
        ),
      )),
    );
  }
}
