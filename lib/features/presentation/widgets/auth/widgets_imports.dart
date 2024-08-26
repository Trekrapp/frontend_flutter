import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';
import 'package:trekr_second/features/data/models/user/request_body_register_model.dart';

import '../../../../core/utils/helpers/validation.dart';
import '../../cubit/user/auth/auth_cubit.dart';
import '../../cubit/user/credential/credential_cubit.dart';
import '../../pages/global/main/main_screen.dart';
import '../global/widgets_imports.dart';

part 'login_form.dart';
part 'login_form_body.dart';
part 'signup_form.dart';
