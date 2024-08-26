part of 'widgets_imports.dart';

class StatusItem extends StatelessWidget {
  const StatusItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w, left: 5.w),
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.havelockBlue)),
            child: Container(
              height: 60.h,
              width: 60.w,
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(AppAssets.avatar))),
            ),
          ),
          Text(
            "You",
            style: GoogleFonts.poppins(
                fontSize: 13.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
