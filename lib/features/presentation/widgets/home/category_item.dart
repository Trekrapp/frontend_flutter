part of 'widgets_imports.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final Color borderColor;
  final String title;
  const CategoryItem(
      {super.key,
      required this.icon,
      required this.borderColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor, width: 6),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
              ],
              shape: BoxShape.circle),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
                size: 25.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp),
        )
      ],
    );
  }
}
