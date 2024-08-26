part of 'widgets_imports.dart';

class TextFieldSearch extends StatelessWidget {
  final String hintText;
  const TextFieldSearch({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextFormField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(color: AppColors.primaryColor),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.primaryColor,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              )),
        ),
      ),
    );
  }
}
