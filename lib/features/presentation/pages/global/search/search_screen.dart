import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';
import 'package:trekr_second/dependencies_injection.dart';
import 'package:trekr_second/features/presentation/cubit/posts/get_posts/get_posts_cubit.dart';

import '../../../widgets/search/widgets_imports.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60.h,
            automaticallyImplyLeading: false,
            flexibleSpace: const HeaderSearch(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const StatusItem();
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: HelperFunctions.screenHeight(context) * .8.h,
                  child: BlocProvider(
                    create: (context) => locator<GetPostsCubit>()..fetchPosts(),
                    child: BlocBuilder<GetPostsCubit, GetPostsState>(
                      builder: (context, state) {
                        if (state is GetPostsLoaded) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 100.h),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.posts.length,
                              itemBuilder: (context, index) {
                                var post = state.posts[index];
                                var isImagePost = post.mediaUrls!.isNotEmpty &&
                                    post.mediaUrls![0].type == 'image';

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: PostItem(
                                    isGradient: false,
                                    content: post.content!,
                                    isImage: isImagePost,
                                    imageUrl: isImagePost
                                        ? post.mediaUrls![0].url!
                                        : null,
                                    postId: post.id,
                                    userImage:
                                        "http://213.130.144.203:8084/files/${post.user!.profileImageUrl}",
                                    userImageExist: post.user != null
                                        ? post.user!.profileImageUrl!.isNotEmpty
                                            ? true
                                            : false
                                        : null,
                                    username: post.user != null
                                        ? post.user!.username!
                                        : "Claire",
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (state is GetPostsLoading) {
                          return LoadingPlaceholderOfVerticalList();
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
