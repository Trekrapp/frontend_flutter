import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60.h,
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 35.w),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.3),
              offset: const Offset(0, 20),
              blurRadius: 20,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home,
                  color: selectedIndex == 0
                      ? Colors.white
                      : AppColors.primaryColor),
              onPressed: () => onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.search,
                  color: selectedIndex == 1
                      ? Colors.white
                      : AppColors.primaryColor),
              onPressed: () => onItemTapped(1),
            ),
            SizedBox(width: 48.w), // The dummy child for the FAB space
            IconButton(
              icon: Icon(Icons.place,
                  color: selectedIndex == 2
                      ? Colors.white
                      : AppColors.primaryColor),
              onPressed: () => onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.person,
                  color: selectedIndex == 3
                      ? Colors.white
                      : AppColors.primaryColor),
              onPressed: () => onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
