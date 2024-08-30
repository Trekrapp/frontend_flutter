part of 'widgets_imports.dart';

class LoadingPlaceholderOfPostsList extends StatelessWidget {
  const LoadingPlaceholderOfPostsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              SizedBox(width: 10.h),
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              SizedBox(width: 10.h),
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              // Add more shimmer loading placeholders as needed
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              SizedBox(width: 10.h),
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              SizedBox(width: 10.h),
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              // Add more shimmer loading placeholders as needed
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              SizedBox(width: 10.h),
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              SizedBox(width: 10.h),
              ShimmerLoading(
                child: Container(
                  width: 110.w,
                  height: HelperFunctions.screenHeight(context) * .15.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              // Add more shimmer loading placeholders as needed
            ],
          ),
        ],
      ),
    );
  }
}
