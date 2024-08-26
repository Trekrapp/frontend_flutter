part of 'widgets_imports.dart';

class PrimaryTitle extends StatelessWidget {
  final String title;
  final String description;
  final void Function() onPressed;
  const PrimaryTitle(
      {super.key,
      required this.title,
      required this.description,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HelperFunctions.screenWidth(context).w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: HelperFunctions.screenWidth(context) * .8,
                  child: Text(
                    description,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.osloGrey,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
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
      ),
    );
  }
}
