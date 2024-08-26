part of 'widgets_imports.dart';

class PostItem extends StatefulWidget {
  final bool? isGradient;
  final String? content;
  final bool? isImage;
  final int? postId;
  final String? imageUrl;
  final String? userImage;
  final bool? userImageExist;
  final String username;
  const PostItem({
    super.key,
    this.isGradient,
    this.content,
    this.isImage,
    this.imageUrl,
    this.postId,
    this.userImage,
    this.userImageExist,
    required this.username,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool _isLiked = false; // Local state to track like status
  int _likeCount = 0; // Local state to track like count

  @override
  void initState() {
    super.initState();
    _fetchInitialLikeStatus();
  }

  Future<void> _fetchInitialLikeStatus() async {
    setState(() {
      _isLiked = false; // Example default value
      _likeCount = 0; // Example default value
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetCommentByPostIdCubit>()
        ..fetchCommentsByPostId(postId: widget.postId!),
      child: BlocBuilder<GetCommentByPostIdCubit, GetCommentByPostIdState>(
        builder: (context, commentState) {
          final commentCount = (commentState is GetCommentByPostIdLoaded)
              ? commentState.comments.length
              : 0;

          return Container(
            height: null,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            width: HelperFunctions.screenWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.blueChalk,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.userImageExist == true
                          ? CircleAvatar(
                              radius: 25.r,
                              backgroundImage: NetworkImage(widget.userImage!),
                            )
                          : Image.asset(
                              AppAssets.avatar,
                            ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Claire Dangais",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "@${widget.username}",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                widget.isImage == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, top: 10.h, bottom: 10.h),
                            child: Text(
                              widget.content!,
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height:
                                HelperFunctions.screenHeight(context) * .27.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "http://213.130.144.203:8084/files/${widget.imageUrl}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                            left: 10.w, top: 10.h, bottom: 10.h),
                        child: Text(
                          widget.content!,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    gradient:
                        widget.isGradient == true ? AppColors.gradient : null,
                    color: widget.isGradient == false
                        ? Colors.black.withOpacity(0.33)
                        : null,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                _showCommentsModal(context, widget.postId!);
                              },
                              child: Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "$commentCount",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            GestureDetector(
                              onTap: () async {
                                // Toggle the like status
                                setState(() {
                                  _isLiked = !_isLiked;
                                  _likeCount += _isLiked ? 1 : -1;
                                });

                                // Perform the API call
                                await reactPost(context);
                              },
                              child: Icon(
                                Icons.favorite,
                                color: _isLiked ? Colors.red : Colors.white,
                                size: 25.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "$_likeCount",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppAssets.send),
                            SizedBox(width: 15.w),
                            Image.asset(AppAssets.huge),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _showCommentsModal(BuildContext context, int postId) {
    final TextEditingController _commentController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CommentItem(
          postId: postId,
        );
      },
    );
  }

  Future<void> reactPost(BuildContext context) async {
    try {
      print(
          "React a post: with post id ${widget.postId} and type ${_isLiked ? "LIKE" : "UNLIKE"}");
      await BlocProvider.of<ReactionPostCubit>(context).reactPosts(
          postId: widget.postId!, type: _isLiked ? "LIKE" : "UNLIKE");
    } catch (e) {
      print("Error reacting to post: $e");
    }
  }
}
