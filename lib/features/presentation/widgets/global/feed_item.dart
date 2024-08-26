part of 'widgets_imports.dart';

class FeedItem extends StatelessWidget {
  final bool? isGradient; // Added imageUrl parameter

  const FeedItem({
    super.key,
    this.isGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: HelperFunctions.screenHeight(context) * .4.h,
          width: HelperFunctions.screenWidth(context),
        ),
        Positioned(
          top: 0.h,
          left: 10.w,
          right: 10.w,
          child: Container(
            height: HelperFunctions.screenHeight(context) * .35.h,
            width: HelperFunctions.screenWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.blueChalk,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.avatar,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Claire Dangais",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "@ClaireD15",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 60.h,
          left: 20.w,
          right: 20.w,
          child: Stack(
            children: [
              Container(
                height: HelperFunctions.screenHeight(context) * .27.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.nature),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -20.h,
                left: 0.w,
                right: 0.w,
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    gradient: isGradient == true ? AppColors.gradient : null,
                    color: isGradient == false
                        ? Colors.black.withOpacity(0.33)
                        : null,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.r),
                      bottomLeft: Radius.circular(30.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                int userId = preferences.getInt("userId")!;
                                Navigator.pushNamed(
                                  context,
                                  NavigationStrings.message,
                                  arguments: userId,
                                );
                              },
                              child: Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "10",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 15.w),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 25.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "122",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppAssets.send),
                            SizedBox(width: 15.w),
                            Image.asset(AppAssets.huge),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
