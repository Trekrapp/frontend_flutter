part of 'widgets_imports.dart';

class HeaderEditProfile extends StatelessWidget {
  const HeaderEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: HelperFunctions.screenHeight(context) * .25.h,
          width: HelperFunctions.screenWidth(context),
        ),
        Positioned(
            child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: HelperFunctions.screenHeight(context) * .25.h,
                      width: HelperFunctions.screenWidth(context) * .45.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.secondaryColor,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(AppAssets.nature),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 40.h,
                        right: 5.w,
                        child: Image.asset(AppAssets.camera))
                  ],
                ),
              ],
            ),
          ],
        )),
        Positioned(
            left: 50.w,
            child: Container(
              height: 85.h,
              width: 85.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(AppAssets.plane))),
            ))
      ],
    );
  }
}
