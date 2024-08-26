import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_assets.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/features/presentation/cubit/comment/create_comment/create_comment_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/comment/get_comment_by_post_id/get_comment_by_post_id_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/posts/reaction_post/reaction_post_cubit.dart';

import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../dependencies_injection.dart';
import '../global/widgets_imports.dart';

part 'comment_item.dart';
part 'header_search.dart';
part 'loading_shimmer_feed.dart';
part 'post_item.dart';
part 'status_item.dart';
