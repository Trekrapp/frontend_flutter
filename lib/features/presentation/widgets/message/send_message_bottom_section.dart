part of 'widgets_imports.dart';

class SendMessageBottomSection extends StatelessWidget {
  const SendMessageBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      width: HelperFunctions.screenWidth(context),
      color: AppColors.mercury,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 25.h),
        child: Row(
          children: [
            const Icon(
              Icons.emoji_emotions_outlined,
              color: AppColors.artyClickWarmRed,
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    fillColor: AppColors.whiteSmoke,
                    filled: true,
                    hintText: "Tapez votre message...",
                    hintStyle: GoogleFonts.abel(
                        fontSize: 15.sp, color: AppColors.mistBlue)),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.artyClickWarmRed,
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.artyClickWarmRed),
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: const Icon(
                    Icons.mic_none,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
