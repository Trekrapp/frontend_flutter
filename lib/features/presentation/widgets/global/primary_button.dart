part of 'widgets_imports.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;
  const PrimaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor, // foreground (text) color
        minimumSize: Size(double.infinity, 55.h), // full width button
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
