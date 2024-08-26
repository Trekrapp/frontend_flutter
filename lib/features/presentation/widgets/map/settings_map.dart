part of 'widgets_imports.dart';

class SettingsMap extends StatelessWidget {
  const SettingsMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(AppAssets.gamingCafe),
                ),
                SizedBox(width: 40.w, child: const Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(AppAssets.map),
                ),
                SizedBox(width: 40.w, child: const Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(AppAssets.compas),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
