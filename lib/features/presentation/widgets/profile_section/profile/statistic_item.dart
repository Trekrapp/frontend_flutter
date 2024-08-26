part of 'widgets_imports.dart';

class StatisticItem extends StatelessWidget {
  final String count, label;
  const StatisticItem({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            count,
            style: GoogleFonts.lato(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor),
          ),
          Text(
            label,
            style: GoogleFonts.lato(fontSize: 14.sp, color: AppColors.liver),
          ),
        ],
      ),
    );
  }
}
