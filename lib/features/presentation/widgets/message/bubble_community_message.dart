part of 'widgets_imports.dart';

class BubbleCommunityMessage extends StatelessWidget {
  const BubbleCommunityMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.screenWidth(context) * .75.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: AppColors.magnolia,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: HelperFunctions.screenWidth(context) * .8.w,
            child: Text(
              "Je suis nouvelle ici au Maroc et je me demande si quelqu'un pourrait m'aider. J'ai du mal à trouver les médicaments dont mes enfants ont besoin, notamment les AQP drags. Si quelqu'un a des conseils ou des recommandations sur les endroits où je pourrais les trouver, je serais vraiment reconnaissante.",
              style: GoogleFonts.abel(
                  fontSize: 14.sp, color: AppColors.primaryColor),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "08:30 AM",
            style: GoogleFonts.abel(
                color: AppColors.artyClickWarmRed, fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
