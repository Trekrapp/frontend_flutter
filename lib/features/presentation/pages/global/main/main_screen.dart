import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trekr_second/features/presentation/pages/global/location/location_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/search/search_screen.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../widgets/home/widgets_imports.dart';
import '../../../widgets/main/custom_bottom_navigation_bar.dart';
import '../../../widgets/main/widgets_imports.dart';
import '../home/home_screen.dart';
import '../profie_section/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final String token;
  const MainScreen({super.key, required this.token});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _isFABActionSheetVisible = false;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const LocationScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isFABActionSheetVisible = false; // hide FABActionSheet when navigating
    });
  }

  void _toggleFABActionSheet() {
    setState(() {
      _isFABActionSheetVisible = !_isFABActionSheetVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: _widgetOptions[_selectedIndex],
          appBar: _selectedIndex == 0
              ? AppBar(
                  iconTheme: IconThemeData(
                      color: AppColors.secondaryColor, size: 28.sp),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                  title: const Text(""),
                )
              : PreferredSize(
                  preferredSize: const Size(0, 0), child: Container()),
          drawer: _selectedIndex == 0 ? const DrawerApp() : Container(),
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _toggleFABActionSheet,
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              child: CustomPaint(
                size: const Size(100, 100),
                painter: FloatingShapeClipper(),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
        if (_isFABActionSheetVisible)
          Positioned(
            bottom: 150.h,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: _toggleFABActionSheet,
              child: Container(
                height: 90.h + 32.w, // 60.h for the sheet height and padding
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const FloatingActionButtonSheet(),
              ),
            ),
          ),
      ],
    );
  }
}
