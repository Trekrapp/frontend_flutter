part of 'widgets_imports.dart';

class ManagementProfileButton extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const ManagementProfileButton(
      {super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          padding: EdgeInsets.symmetric(horizontal: 32.w),
        ),
        child: Center(
          child: Text(
            textButton,
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
