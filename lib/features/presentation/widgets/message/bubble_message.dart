part of 'widgets_imports.dart';

class BubbleMessage extends StatefulWidget {
  final MessageEntity message;
  final bool isCurrentUser;

  const BubbleMessage({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  State<BubbleMessage> createState() => _BubbleMessageState();
}

class _BubbleMessageState extends State<BubbleMessage> {
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    final alignment =
        widget.isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start;
    final bgColor = widget.isCurrentUser ? AppColors.lightSalmon : Colors.white;
    final textColor = widget.isCurrentUser ? Colors.white : Colors.black;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.h,
        left: widget.isCurrentUser ? 0.w : 10.w,
        right: widget.isCurrentUser ? 10.w : 0.w,
      ),
      child: Column(
        crossAxisAlignment: widget.isCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isShow = !isShow;
              });
            },
            child: Row(
              mainAxisAlignment: alignment,
              children: [
                IntrinsicWidth(
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width *
                            0.7), // Optional constraint
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r),
                        bottomLeft: widget.isCurrentUser
                            ? Radius.circular(30.r)
                            : Radius.zero,
                        bottomRight: widget.isCurrentUser
                            ? Radius.zero
                            : Radius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      widget.message.content!,
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isShow)
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 5.h),
              child: Text(
                DateFormat.jm()
                    .format(DateTime.parse(widget.message.timestamp!)),
                style: GoogleFonts.poppins(
                  color: Colors.grey.withOpacity(0.5),
                  fontSize: 12.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
