import 'package:flutter/material.dart';
import 'package:trekr_second/core/routes/routes.dart';
import 'package:trekr_second/features/presentation/pages/auth/auth_screen.dart';
import 'package:trekr_second/features/presentation/pages/forget_password/confirm_verification_code.dart';
import 'package:trekr_second/features/presentation/pages/forget_password/create_new_password.dart';
import 'package:trekr_second/features/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:trekr_second/features/presentation/pages/forget_password/success_creation_password_screen.dart';
import 'package:trekr_second/features/presentation/pages/forget_password/verify_code_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/add_post/add_post_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/feed/feed_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/join_community/join_community_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/main/main_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/map/map_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/message/chat_with_community_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/message/message_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/plan_trip/plan_trip_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/plan_trip/result_plan_trip.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/clear_cache_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/language_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/notifications_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/privacy_and_location.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/settings_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/support/learn_more_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/support/report_problem_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/support/success_send_report_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/support/support_help_screen.dart';
import 'package:trekr_second/features/presentation/pages/global/profie_section/settings/support/terms_and_condition_screen.dart';
import 'package:trekr_second/features/presentation/pages/location/choose_location_screen.dart';
import 'package:trekr_second/features/presentation/pages/onboard/onboard_screen.dart';
import 'package:trekr_second/features/presentation/pages/splash/splash_screen.dart';

import '../../features/domain/entities/user/user_entity.dart';
import '../../features/presentation/pages/global/home/home_screen.dart';
import '../../features/presentation/pages/global/profie_section/edit_profile/edit_profile_screen.dart';
import '../../features/presentation/pages/global/profie_section/settings/support/need_help_screen.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final String? token = const UserEntity().accessToken;
    switch (settings.name) {
      case NavigationStrings.auth:
        {
          return routeBuilder(const AuthScreen());
        }
      case NavigationStrings.splash:
        {
          return routeBuilder(const SplashScreen());
        }
      case NavigationStrings.location:
        {
          return routeBuilder(const ChooseLocationScreen());
        }
      case NavigationStrings.home:
        {
          return routeBuilder(const HomeScreen());
        }
      case NavigationStrings.onboard:
        {
          return routeBuilder(const OnboardScreen());
        }
      case NavigationStrings.main:
        {
          return routeBuilder(MainScreen(
            token: token!,
          ));
        }
      case NavigationStrings.editProfile:
        {
          return routeBuilder(const EditProfileScreen());
        }
      case NavigationStrings.settings:
        {
          return routeBuilder(const SettingsScreen());
        }
      case NavigationStrings.privacyAndLocation:
        {
          return routeBuilder(const PrivacyAndLocation());
        }
      case NavigationStrings.notifications:
        {
          return routeBuilder(const NotificationsScreen());
        }
      case NavigationStrings.language:
        {
          return routeBuilder(const LanguageScreen());
        }
      case NavigationStrings.clearCache:
        {
          return routeBuilder(const ClearCacheScreen());
        }
      case NavigationStrings.supportHelp:
        {
          return routeBuilder(const SupportAndHelpScreen());
        }
      case NavigationStrings.reportProblem:
        {
          return routeBuilder(const ReportProblemScreen());
        }
      case NavigationStrings.needHelp:
        {
          return routeBuilder(const NeedHelpScreen());
        }
      case NavigationStrings.termsConditions:
        {
          return routeBuilder(const TermsAndConditionsScreen());
        }
      case NavigationStrings.learnMore:
        {
          return routeBuilder(const LearnMoreScreen());
        }
      case NavigationStrings.successOperation:
        {
          return routeBuilder(const SuccessSendReportScreen());
        }
      case NavigationStrings.addPost:
        {
          return routeBuilder(const AddPostScreen());
        }
      case NavigationStrings.discover:
        return routeBuilder(const FeedScreen());
      case NavigationStrings.message:
        if (args is int) {
          return routeBuilder(MessageScreen(
            loggedInUserId: args,
          ));
        }
      case NavigationStrings.planTrip:
        return routeBuilder(const PlanTripScreen());
      case NavigationStrings.resultPlanTrip:
        return routeBuilder(const ResultTripPlanScreen());
      case NavigationStrings.friendsDiscover:
        return routeBuilder(const MapScreen());
      case NavigationStrings.joinCommunity:
        return routeBuilder(const JoinCommunityScreen());
      case NavigationStrings.forgetPassword:
        return routeBuilder(const ForgetPasswordScreen());
      case NavigationStrings.verifyCode:
        if (args is String) {
          return routeBuilder(VerifyCodeScreen(
            email: args,
          ));
        }

      case NavigationStrings.confirmVerificationCode:
        if (args is String) {
          return routeBuilder(ConfirmVerificationCode(
            verificationCode: args,
          ));
        }

      case NavigationStrings.newPassword:
        if (args is String) {
          return routeBuilder(CreateNewPasswordScreen(
            verificationCode: args,
          ));
        }
      case NavigationStrings.successCreationPassword:
        return routeBuilder(const SuccessCreationPasswordScreen());
      case NavigationStrings.chatWithCommunity:
        return routeBuilder(const ChatWithCommunityScreen());
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
      ),
      body: Center(
        child: Text("Page not found"),
      ),
    );
  }
}
