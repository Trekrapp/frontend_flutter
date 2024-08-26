part of 'widgets_imports.dart';

class TextFieldPlanTrip extends StatelessWidget {
  final String hintText;
  final String labelText;
  final int? maxLines;
  const TextFieldPlanTrip(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: GoogleFonts.nunito(color: AppColors.primaryColor),
            filled: false,
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.primaryColor,
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: AppColors.primaryColor,
            )),
            label: Container(
              height: 16.h,
              color: AppColors.mercury,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  labelText,
                  style: GoogleFonts.nunito(
                      fontSize: 12.sp, color: AppColors.primaryColor),
                ),
              ),
            )),
      ),
    );
  }
}
