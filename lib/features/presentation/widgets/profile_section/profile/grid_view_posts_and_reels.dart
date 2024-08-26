part of 'widgets_imports.dart';

class GridViewPostsAndReels extends StatelessWidget {
  final int count;
  const GridViewPostsAndReels({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4.w,
            crossAxisSpacing: 4.h,
            childAspectRatio: 1,
            mainAxisExtent: 200),
        itemCount: count,
        itemBuilder: (context, index) {
          return Container(
            width: 110.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(AppAssets.post1))),
          );
        },
      ),
    );
  }
}
