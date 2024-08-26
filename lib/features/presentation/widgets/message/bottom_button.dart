part of 'widgets_imports.dart';

class BottomButton extends StatelessWidget {
  final IconData icon;
  final void Function() onTap;
  const BottomButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 40.h,
          width: 40.w,
          decoration: const BoxDecoration(
              color: AppColors.primaryColor, shape: BoxShape.circle),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Icon(
              icon,
              color: AppColors.blueChalk,
              size: 21.sp,
            ),
          )),
    );
  }
}
