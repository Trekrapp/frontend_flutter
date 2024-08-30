part of 'widgets_imports.dart';

class TextFieldChangePassword extends StatelessWidget {
  final String hintText;
  final bool? isSuffix;
  final void Function()? onPressed;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  const TextFieldChangePassword(
      {super.key,
      required this.hintText,
      this.isSuffix = false,
      this.onPressed,
      this.controller,
      this.validator,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      style: GoogleFonts.inter(
          fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w400),
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(fontSize: 14.sp, color: AppColors.liver),
        filled: false,
        suffixIcon: isSuffix == true
            ? GestureDetector(
                onTap: onPressed,
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryColor,
                ))
            : null,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.liver.withOpacity(0.14)),
            borderRadius: BorderRadius.circular(6.r)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.liver.withOpacity(0.14)),
            borderRadius: BorderRadius.circular(6.r)),
      ),
    );
  }
}
