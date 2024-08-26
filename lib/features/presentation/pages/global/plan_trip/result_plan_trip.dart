import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';

class ResultTripPlanScreen extends StatelessWidget {
  const ResultTripPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Planifiez Votre Voyage",
            style: GoogleFonts.nunito(
                fontSize: 22.sp, color: AppColors.secondaryColor),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondaryColor,
                  )),
              child: const Center(
                  child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ))),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 35.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: HelperFunctions.screenHeight(context) * .28.h,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height:
                                      HelperFunctions.screenHeight(context) *
                                          .19.h,
                                  width: HelperFunctions.screenWidth(context) *
                                      .52.w,
                                  child: CustomPaint(
                                    size: const Size(200, 200),
                                    painter: BudgetIndicatorPainter(),
                                    child: Center(
                                      child: Text(
                                        'Budget\n10000 £',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.sp,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Indicator(
                                          color: AppColors.primaryColor,
                                          text: "Hébergement"),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Indicator(
                                          color: AppColors.artyClickWarmRed,
                                          text: "billets"),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Indicator(
                                          color: AppColors.secondaryColor,
                                          text: "autres"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 30.h),
                            SizedBox(
                              height: 30.h,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                child: Text(
                                  'Télécharger',
                                  style: GoogleFonts.inter(
                                      fontSize: 15.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 120.h,
                          right: -40,
                          child: Image.asset(
                            AppAssets.travel2,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return TripDayDetail(day: index + 1);
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(18.0),
                    margin: EdgeInsets.symmetric(
                        vertical: 20.0.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: AppColors.lightSalmon,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vos conseils pour ce voyage',
                            style: GoogleFonts.inter(
                              color: AppColors.primaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Si vous souhaitez faire du shopping, explorez les marchés aux puces et les friperies pour des trouvailles uniques à des prix abordables.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontSize: 14.0, color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: -100,
                      left: 50.w,
                      right: 50.w,
                      child: Image.asset(
                        AppAssets.tripBag,
                      )),
                  Positioned(
                      top: -70,
                      right: -30.w,
                      child: Image.asset(
                        AppAssets.bag,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  Indicator({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5.r)),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 13.sp, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}

class TripDayDetail extends StatelessWidget {
  final int day;
  final bool? isFirst;
  TripDayDetail({super.key, required this.day, this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return isFirst == true
        ? Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: AppColors.secondaryColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jour $day',
                          style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor),
                        ),
                        Text(
                          '20 jul,2024',
                          style: GoogleFonts.inter(
                              fontSize: 14.0, color: AppColors.lightSalmon),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 60.h,
                      child: VerticalDivider(
                        color: AppColors.artyClickWarmRed,
                        thickness: 2,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Arrivée à Reykjavík et installation à votre hôtel.',
                          style: GoogleFonts.inter(
                              fontSize: 14.0,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '• Hôtel Le Paris',
                          style: GoogleFonts.inter(
                              fontSize: 14.0,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '• Explorez Paris, la capitale de la France.',
                          style: GoogleFonts.inter(
                              fontSize: 14.0,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(top: 8.h, left: 16.w, bottom: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 70.h,
                      child: VerticalDivider(
                        color: AppColors.artyClickWarmRed,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: HelperFunctions.screenWidth(context) * .82.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jour $day',
                            style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                          Text(
                            '20 jul,2024',
                            style: GoogleFonts.inter(
                                fontSize: 12.sp, color: AppColors.lightSalmon),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• Arrivée à Reykjavík et installation à votre hôtel.',
                                style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '• Hôtel Le Paris',
                                style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '• Explorez Paris, la capitale de la France.',
                                style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}

class BudgetIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -90.0;
    double sweepAngle1 = 120.0; // Corresponds to 33% (120 degrees)
    double sweepAngle2 = 120.0; // Corresponds to 33% (120 degrees)
    double sweepAngle3 = 120.0; // Corresponds to 33% (120 degrees)

    Paint paint1 = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    Paint paint2 = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    Paint paint3 = Paint()
      ..color = AppColors.artyClickWarmRed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 80.0),
      radians(startAngle),
      radians(sweepAngle1),
      false,
      paint1,
    );

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 80.0),
      radians(startAngle + sweepAngle1),
      radians(sweepAngle2),
      false,
      paint2,
    );

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 80.0),
      radians(startAngle + sweepAngle1 + sweepAngle2),
      radians(sweepAngle3),
      false,
      paint3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  double radians(double degrees) {
    return degrees * (3.1415926535897932 / 180.0);
  }
}
