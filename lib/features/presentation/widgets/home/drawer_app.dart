part of 'widgets_imports.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.veryLightPink,
      child: ListView(
        padding: EdgeInsets.only(top: 20.h),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Image.asset(AppAssets.avatar),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Melisse Peters",
                      style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          color: AppColors.mirage,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "melissapet@gmail.com",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp, color: AppColors.davyGrey),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: Text('Notifications',
                style: GoogleFonts.inter(
                  color: AppColors.davyGrey,
                  fontSize: 15.sp,
                )),
            onTap: () {
              // Handle your onTap here
            },
          ),
          ListTile(
            leading: SvgPicture.asset(AppAssets.medal),
            title: Text('Communauté',
                style: GoogleFonts.inter(
                  color: AppColors.davyGrey,
                  fontSize: 15.sp,
                )),
            onTap: () =>
                Navigator.pushNamed(context, NavigationStrings.joinCommunity),
          ),
          ListTile(
            leading: SvgPicture.asset(AppAssets.location),
            title: Text('Carte',
                style: GoogleFonts.inter(
                  color: AppColors.davyGrey,
                  fontSize: 15.sp,
                )),
            onTap: () {
              // Handle your onTap here
            },
          ),
          ListTile(
            leading: SvgPicture.asset(AppAssets.contact),
            title: Text('Contact',
                style: GoogleFonts.inter(
                  color: AppColors.davyGrey,
                  fontSize: 15.sp,
                )),
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              int? userId = preferences.getInt("userId");
              Navigator.pushNamed(context, NavigationStrings.message,
                  arguments: userId);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(AppAssets.discount),
            title: Text('Découvrez plus',
                style: GoogleFonts.inter(
                  color: AppColors.davyGrey,
                  fontSize: 15.sp,
                )),
            onTap: () {
              // Handle your onTap here
            },
          ),
          ListTile(
            leading: SvgPicture.asset(AppAssets.discount),
            title: Text('Accessible en fauteuil roulant',
                style: GoogleFonts.inter(
                  color: AppColors.davyGrey,
                  fontSize: 15.sp,
                )),
            onTap: () {
              // Handle your onTap here
            },
          ),
          const SizedBox(
            height: 52,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 0.h), // Add padding at the bottom
            child: Image(
              image: const AssetImage(AppAssets.bottomDrawer),
              width: HelperFunctions.screenWidth(context).w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
