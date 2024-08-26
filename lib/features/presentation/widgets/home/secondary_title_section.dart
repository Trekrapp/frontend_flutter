part of 'widgets_imports.dart';

class SecondaryTitle extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const SecondaryTitle(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 17.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w800),
          ),
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(1, 1))
                  ]),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.primaryColor,
                  size: 25.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
