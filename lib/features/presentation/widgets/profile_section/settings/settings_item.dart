part of 'widgets_imports.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;
  const SettingsItem(
      {super.key, required this.icon, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              size: 25.sp,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
