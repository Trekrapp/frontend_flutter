part of 'widgets_imports.dart';

class LoadingPlaceholderOfVerticalList extends StatelessWidget {
  const LoadingPlaceholderOfVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        ShimmerLoading(
          child: Container(
            width: double.infinity,
            height: HelperFunctions.screenHeight(context) * .25.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.r)),
          ),
        ),
        SizedBox(height: 10.h),
        ShimmerLoading(
          child: Container(
            width: double.infinity,
            height: HelperFunctions.screenHeight(context) * .15.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.r)),
          ),
        ),
        SizedBox(height: 10.h),
        ShimmerLoading(
          child: Container(
            width: double.infinity,
            height: HelperFunctions.screenHeight(context) * .15.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.r)),
          ),
        ),
        // Add more shimmer loading placeholders as needed
      ],
    );
  }
}
