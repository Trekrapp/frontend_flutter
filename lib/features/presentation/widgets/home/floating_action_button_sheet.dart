part of 'widgets_imports.dart';

class FloatingActionButtonSheet extends StatelessWidget {
  const FloatingActionButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionIcon(context,
              image: AppAssets.post,
              label: "Post",
              onTap: () =>
                  Navigator.pushNamed(context, NavigationStrings.addPost)),
          _buildActionIcon(
            context,
            image: AppAssets.balloon,
            label: "Communauté",
          ),
          _buildActionIcon(
            context,
            image: AppAssets.tourGuide,
            label: "Live",
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(BuildContext context,
      {required String image, required String label, void Function()? onTap}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.veryLightPink,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(image),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: GoogleFonts.lato(
            color: AppColors.vampireGrey,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
