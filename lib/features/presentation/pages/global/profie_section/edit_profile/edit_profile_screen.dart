import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/features/presentation/widgets/global/widgets_imports.dart';

import '../../../../widgets/profile_section/edit_section/widgets_imports.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  DateTime birthDate = DateTime(2024, 07, 01);
  Country? _selectedCountry;
  String? _selectedState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Modifier",
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderEditProfile(),
            Form(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nom",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const TextFieldProfile(
                    hintText: 'Soukaina Bouchareb',
                    isSuffix: false,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Email",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const TextFieldProfile(
                    hintText: 'melpeters@gmail.com',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Mot de Passe",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const TextFieldProfile(
                    hintText: '************',
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Mot de Passe",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFieldProfile(
                    hintText:
                        "${birthDate.month}/${birthDate.day}/${birthDate.year}",
                    isSuffix: true,
                    onPressed: () async {
                      String birthDateInString;
                      birthDateInString =
                          "${birthDate.month}/${birthDate.day}/${birthDate.year}";
                      final datePick = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (datePick != null && datePick != birthDate) {
                        setState(() {
                          birthDate = datePick;
                          isDateSelected = true;
                          birthDateInString =
                              "${birthDate.month}/${birthDate.day}/${birthDate.year}";
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Pays",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,
                        onSelect: (Country country) {
                          setState(() {
                            _selectedCountry = country;
                          });
                        },
                      );
                    },
                    child: Card(
                      elevation: 0,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 15.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            if (_selectedCountry != null)
                              Image.asset(
                                'assets/flags/${_selectedCountry!.countryCode.toLowerCase()}.png',
                                width: 24,
                                height: 24,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.flag),
                              ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                _selectedCountry?.name ?? 'Select a country',
                                style: GoogleFonts.inter(fontSize: 14.sp),
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                size: 24, color: AppColors.secondaryColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
