part of 'widgets_imports.dart';

class LatestCommunity extends StatefulWidget {
  const LatestCommunity({super.key});

  @override
  State<LatestCommunity> createState() => _LatestCommunityState();
}

class _LatestCommunityState extends State<LatestCommunity> {
  bool isLast = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: List.generate(5, (index) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 10.w, top: 5.h, right: 10.w, bottom: 5.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15.r,
                        backgroundImage: const AssetImage(AppAssets.avatar1),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: HelperFunctions.screenWidth(context) * .75.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hell Boy",
                                  style: GoogleFonts.abel(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "1:20 PM",
                                      style: GoogleFonts.abel(
                                          color: Colors.black12),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black12,
                                      size: 18.sp,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .74,
                            child: Text(
                              "Envoyez-moi quelques détails sur le musée de Paris, moyen facile d'y aller",
                              style: GoogleFonts.abel(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black12),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  if (index != 4) // Check if it's not the last item
                    const Divider(
                      color: Colors.black12,
                    )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
