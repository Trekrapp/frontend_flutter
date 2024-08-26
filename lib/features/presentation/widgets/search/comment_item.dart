part of 'widgets_imports.dart';

class CommentItem extends StatefulWidget {
  final int postId;
  const CommentItem({super.key, required this.postId});

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  final TextEditingController _commentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _commentController.addListener(() {
      setState(() {}); // Trigger a rebuild when the text changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.99,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return BlocProvider(
          create: (context) => locator<GetCommentByPostIdCubit>()
            ..fetchCommentsByPostId(postId: widget.postId),
          child: BlocConsumer<CreateCommentCubit, CreateCommentState>(
            listener: (context, state) {
              if (state is CreateCommentLoaded) {
                // Trigger a fetch for updated comments
                BlocProvider.of<GetCommentByPostIdCubit>(context)
                    .fetchCommentsByPostId(postId: widget.postId);
              }
            },
            builder: (context, createCommentState) {
              return BlocBuilder<GetCommentByPostIdCubit,
                  GetCommentByPostIdState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (state is GetCommentByPostIdLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is GetCommentByPostIdLoaded) {
                              return ListView.builder(
                                itemCount: state.comments.length,
                                itemBuilder: (context, index) {
                                  final comment = state.comments[index];
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(top: 20.h, left: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          comment.user!.username!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          comment.content!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 13.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.favorite_border,
                                              color: AppColors.primaryColor,
                                              size: 18.sp,
                                            ),
                                            SizedBox(width: 10.w),
                                            Icon(
                                              Icons.message,
                                              color: AppColors.primaryColor,
                                              size: 18.sp,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else if (state is GetCommentByPostIdFailure) {
                              return Center(child: Text(state.message));
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _commentController,
                                  decoration: InputDecoration(
                                    hintText: 'Add a comment...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  maxLines: 1,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a comment';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  createComment(
                                      context, _commentController.text);
                                },
                                icon: Icon(Icons.send),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  void createComment(BuildContext context, String content) {
    print("Post Id: ${widget.postId}");
    print("Content: $content");
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<CreateCommentCubit>(context)
          .createComment(postId: widget.postId, content: content);
    }
  }
}
