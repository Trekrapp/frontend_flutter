part of 'widgets_imports.dart';

class GridViewPostsAndReels extends StatelessWidget {
  const GridViewPostsAndReels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetPostsUserCubit>()..fetchPostsUser(),
      child: BlocBuilder<GetPostsUserCubit, GetPostsUserState>(
        builder: (context, state) {
          if (state is GetPostsUserLoaded) {
            final postsUser = state.postsUser;

            // Check if postsUser is empty or contains no media URLs
            bool hasMedia = postsUser.any(
                (post) => post.mediaUrls != null && post.mediaUrls!.isNotEmpty);

            if (hasMedia) {
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
                    mainAxisExtent: 200,
                  ),
                  itemCount: postsUser.length,
                  itemBuilder: (context, index) {
                    final postUser = postsUser[index].mediaUrls;
                    return Container(
                      width: 110.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "http://213.130.144.203:8084/files/${postUser![0].url!}"), // Use the first image in the list
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              // If no media URLs exist, display the fallback container
              return Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center vertically
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: Colors.red,
                    size: 50.sp, // Adjust icon size as needed
                  ),
                  SizedBox(height: 20.h), // Space between icon and text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Soyez le premier à lancer la conversation! Partagez vos pensées et vos images avec la communauté et laissez votre créativité ouvrir la voie.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp, // Adjust text size as needed
                      ),
                    ),
                  ),
                ],
              );
            }
          } else if (state is GetPostsUserLoading) {
            return LoadingPlaceholderOfPostsList();
          } else {
            return Container(); // Handle other states like error or empty state
          }
        },
      ),
    );
  }
}
