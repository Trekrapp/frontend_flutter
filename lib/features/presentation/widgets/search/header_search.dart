part of 'widgets_imports.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.blueChalk),
              child: Icon(
                Icons.camera_alt,
                color: AppColors.secondaryColor,
                size: 25.sp,
              )),
          Text(
            "Explorer",
            style: GoogleFonts.poppins(
                fontSize: 20.sp,
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w600),
          ),
          Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.blueChalk),
              child: Icon(
                Icons.notifications,
                color: AppColors.secondaryColor,
                size: 25.sp,
              )),
        ],
      ),
    );
  }
}
