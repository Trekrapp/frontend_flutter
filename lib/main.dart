import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trekr_second/features/presentation/cubit/messages/websocket/websocket_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/posts/get_posts/get_posts_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/posts/reaction_post/reaction_post_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/user/forgot_password/forgot_password_cubit.dart';
import 'package:trekr_second/features/presentation/pages/auth/auth_screen.dart';

import 'core/routes/on_general_routes.dart';
import 'core/theme/app_theme.dart';
import 'dependencies_injection.dart';
import 'features/data/data_sources/remote/remote_data_source.dart';
import 'features/data/data_sources/remote/remote_data_source_impl.dart';
import 'features/presentation/cubit/comment/create_comment/create_comment_cubit.dart';
import 'features/presentation/cubit/comment/get_comment_by_post_id/get_comment_by_post_id_cubit.dart';
import 'features/presentation/cubit/messages/get_messages/get_messages_cubit.dart';
import 'features/presentation/cubit/search/search/search_posts_users_cubit.dart';
import 'features/presentation/cubit/user/auth/auth_cubit.dart';
import 'features/presentation/cubit/user/create_new_password/create_new_password_cubit.dart';
import 'features/presentation/cubit/user/credential/credential_cubit.dart';
import 'features/presentation/pages/global/main/main_screen.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Dio client = Dio();
  RemoteDataSource remoteDataSource = RemoteDataSourceImpl(client: client);
  print(remoteDataSource.searchPostsAndUsers("test"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => locator<CredentialCubit>()),
        BlocProvider(create: (_) => locator<ForgotPasswordCubit>()),
        BlocProvider(create: (_) => locator<CreateNewPasswordCubit>()),
        BlocProvider(create: (_) => locator<GetPostsCubit>()),
        BlocProvider(create: (_) => locator<GetMessagesCubit>()),
        BlocProvider(create: (_) => locator<SearchPostsUsersCubit>()),
        BlocProvider<WebSocketCubit>(
          create: (context) => locator<WebSocketCubit>(),
        ),
        BlocProvider(create: (_) => locator<GetCommentByPostIdCubit>()),
        BlocProvider(create: (_) => locator<CreateCommentCubit>()),
        BlocProvider(create: (_) => locator<ReactionPostCubit>()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.lightTheme,
          supportedLocales: const [
            Locale('en'),
            Locale('fr'),
          ],
          localizationsDelegates: const [
            CountryLocalizations.delegate,
          ],
          onGenerateRoute: OnGenerateRoute.route,
          initialRoute: "/",
          routes: {
            "/": (context) => BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, authState) {
                    if (authState is Authenticated) {
                      return MainScreen(
                        token: authState.token,
                      );
                    } else {
                      return const AuthScreen();
                    }
                  },
                )
          },
        ),
      ),
    );
  }
}
