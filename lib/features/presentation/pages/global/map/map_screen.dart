import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';

import '../../../widgets/map/widgets_imports.dart';
import 'map_model_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapModelView mapModelView = MapModelView();
  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    for (final user in mapModelView.users) {
      print("Loading marker for user: ${user["name"]}");
      final Uint8List markerIcon =
          await mapModelView.getBytesFromAsset(user["image"], 100);

      if (markerIcon.isEmpty) {
        print("Marker icon is empty for ${user["name"]}");
        continue;
      }
      print("Adding marker for ${user["name"]}");
      final Marker marker = Marker(
        markerId: MarkerId(user["name"]),
        position: LatLng(user["lat"], user["lng"]),
        infoWindow: InfoWindow(title: user["name"]),
        icon: BitmapDescriptor.bytes(markerIcon),
      );

      setState(() {
        mapModelView.markers.add(marker);
      });
    }
  }

  void onCategorySelected(String category) {
    setState(() {
      mapModelView.selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: mapModelView.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: mapModelView.center,
                zoom: 13,
              ),
              markers: mapModelView.markers,
              polylines: Set<Polyline>.of(mapModelView.polylines.values),
            ),
            Positioned(
              top: 50.h,
              left: 10.w,
              right: 10.w,
              child: const TextFieldSearch(
                hintText: "Search",
              ),
            ),
            Positioned(
              top: 100.0,
              left: 10.0,
              right: 10.0,
              child: Container(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: mapModelView.categories.map((category) {
                    return GestureDetector(
                      onTap: () => onCategorySelected(category['name']!),
                      child: Column(
                        children: [
                          if (mapModelView.selectedCategory != category['name'])
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text(
                                category['name']!,
                                style: GoogleFonts.inter(
                                    fontSize: 13.sp,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          if (mapModelView.selectedCategory == category['name'])
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 4.0, right: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              height: 25.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.secondaryColor
                                      .withOpacity(0.46)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    category['name']!,
                                    style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Positioned(
                top: 10.h,
                left: 10.w,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.secondaryColor,
                        )),
                    Text(
                      'Carte des Voyageurs',
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: AppColors.artyClickWarmRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Positioned(
              bottom: 20.0,
              left: 10.0,
              right: 10.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      mapModelView.isOpen = !mapModelView.isOpen;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      textStyle: const TextStyle(fontSize: 18.0),
                      backgroundColor: AppColors.artyClickWarmRed),
                  child: Text(
                    'Communauté',
                    style:
                        GoogleFonts.inter(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 10,
                right: 10,
                child: mapModelView.isOpen == true
                    ? Container(
                        width: HelperFunctions.screenWidth(context),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        mapModelView.isOpen = false;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: AppColors.artyClickWarmRed,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Communauté",
                                style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    color: AppColors.artyClickWarmRed,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Avez-vous des questions,  souhaitez-vous partager quelque  chose sur votre dernier voyage ? Rejoignez la communauté.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: ElevatedButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, NavigationStrings.joinCommunity),
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 13.0, horizontal: 15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      textStyle:
                                          const TextStyle(fontSize: 18.0),
                                      backgroundColor:
                                          AppColors.artyClickWarmRed),
                                  child: Text(
                                    'Rejoindre la communauté',
                                    style: GoogleFonts.inter(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container()),
            Positioned(
                top: HelperFunctions.screenWidth(context) * .8.h,
                left: 10.w,
                child: const SettingsMap())
          ],
        ),
      ),
    );
  }
}
