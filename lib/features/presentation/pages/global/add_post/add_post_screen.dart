import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';
import 'package:trekr_second/features/presentation/widgets/global/widgets_imports.dart';

import '../../../widgets/profile_section/settings/widgets_imports.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Créer un post"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          children: [
            const TextFieldSupport(
              hintText: "Quelles sont vos nouvelles aujourd'hui",
              labelText: "Post",
              maxLines: null,
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: HelperFunctions.screenHeight(context) * .15.h,
              width: HelperFunctions.screenWidth(context),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(color: AppColors.primaryColor, width: 1.2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_download_outlined,
                    color: AppColors.secondaryColor,
                    size: 20.sp,
                  ),
                  Text(
                    "Télécharger image ici",
                    style: GoogleFonts.poppins(
                        color: AppColors.primaryColor, fontSize: 12.sp),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
