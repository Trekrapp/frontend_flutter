part of 'widgets_imports.dart';

class SupportItem extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const SupportItem({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 16.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600),
          ),
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryColor,
              ))
        ],
      ),
    );
  }
}
