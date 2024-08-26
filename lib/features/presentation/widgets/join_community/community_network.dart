part of 'widgets_imports.dart';

class CommunityNetwork extends StatelessWidget {
  const CommunityNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HelperFunctions.screenHeight(context) * .16.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: HelperFunctions.screenHeight(context) * .1.h,
                      width: HelperFunctions.screenWidth(context) * .3,
                      margin: EdgeInsets.only(right: 5.w, left: 5.w),
                    ),
                    Positioned(
                        left: 10.w,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundImage: const AssetImage(AppAssets.avatar),
                        )),
                    Positioned(
                        right: 30.w,
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundImage: const AssetImage(AppAssets.avatar),
                        )),
                    Positioned(
                        top: 47.h,
                        left: 30.w,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundImage: const AssetImage(AppAssets.avatar),
                        )),
                    Positioned(
                        top: 25.h,
                        right: 25.w,
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundImage: const AssetImage(AppAssets.avatar),
                        )),
                  ],
                ),
                Text(
                  "Nomadia",
                  style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w300),
                )
              ],
            );
          }),
    );
  }
}
