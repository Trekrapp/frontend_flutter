import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../widgets/global/widgets_imports.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({super.key});

  @override
  _ChooseLocationScreenState createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  Country? _selectedCountry;
  String? _selectedState;

  List<String> _states = ['VIC', 'NSW', 'QLD', 'SA', 'WA', 'TAS', 'NT', 'ACT'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back action
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Premièrement, pouvez-vous nous dire où vous habitez ?',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Location',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
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
                  elevation: 2,
                  surfaceTintColor: AppColors.desertStorm,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.desertStorm),
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.desertStorm,
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
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Etat',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Container(
                width: HelperFunctions.screenWidth(context),
                height: 55.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.desertStorm),
                    color: AppColors.desertStorm),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 16.sp,
                    ),
                    value: _selectedState,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedState = newValue!;
                      });
                    },
                    items:
                        _states.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
              Image.asset(
                AppAssets.path,
                height: HelperFunctions.screenHeight(context) * .25.h,
                width: HelperFunctions.screenWidth(context) * .8.w,
              ),
              const Spacer(),
              PrimaryButton(
                  text: "Fait",
                  onPressed: () {
                    Navigator.pushNamed(context, NavigationStrings.onboard);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
