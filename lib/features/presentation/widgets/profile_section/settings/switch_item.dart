part of 'widgets_imports.dart';

class SwitchItem extends StatelessWidget {
  final String title;
  const SwitchItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
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
          Switch(
              activeColor: AppColors.secondaryColor,
              inactiveThumbColor: AppColors.primaryColor,
              value: true,
              onChanged: (value) {})
        ],
      ),
    );
  }
}
