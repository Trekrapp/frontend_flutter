part of 'widgets_imports.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: AppColors.greenWhite,
        minimumSize: Size(double.infinity, 48.h),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.google, // Make sure you have this asset
            height: 24,
            width: 24,
          ),
          SizedBox(
            width: 60.w,
          ),
          Text(
            'Continuer avec Google',
            style: TextStyle(color: AppColors.thunder, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
