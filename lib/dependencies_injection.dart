import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:trekr_second/core/utils/helpers/websockets.dart';
import 'package:trekr_second/features/domain/use_cases/auth/forgot_password_use_case.dart';
import 'package:trekr_second/features/domain/use_cases/messages/create_message_use_case.dart';
import 'package:trekr_second/features/domain/use_cases/messages/get_message_use_case.dart';
import 'package:trekr_second/features/domain/use_cases/posts/fetch_posts_use_case.dart';
import 'package:trekr_second/features/domain/use_cases/search/search_posts_and_users_use_case.dart';
import 'package:trekr_second/features/presentation/cubit/messages/get_messages/get_messages_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/messages/websocket/websocket_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/posts/get_posts/get_posts_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/posts/get_posts_user/get_posts_user_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/posts/reaction_post/reaction_post_cubit.dart';
import 'package:trekr_second/features/presentation/cubit/search/search/search_posts_users_cubit.dart';

import 'features/data/data_sources/remote/remote_data_source.dart';
import 'features/data/data_sources/remote/remote_data_source_impl.dart';
import 'features/data/repositories/repository_impl.dart';
import 'features/domain/repositories/repository.dart';
import 'features/domain/use_cases/auth/change_password_use_case.dart';
import 'features/domain/use_cases/auth/get_current_token_use_case.dart';
import 'features/domain/use_cases/auth/is_sign_in_use_case.dart';
import 'features/domain/use_cases/auth/login_user_use_case.dart';
import 'features/domain/use_cases/auth/register_user_use_case.dart';
import 'features/domain/use_cases/auth/reset_password_use_case.dart';
import 'features/domain/use_cases/comment/create_comment_use_case.dart';
import 'features/domain/use_cases/comment/fetch_comment_by_post_id_use_case.dart';
import 'features/domain/use_cases/posts/fetch_posts_user_use_case.dart';
import 'features/domain/use_cases/reaction-post/react_post_use_case.dart';
import 'features/presentation/cubit/comment/create_comment/create_comment_cubit.dart';
import 'features/presentation/cubit/comment/get_comment_by_post_id/get_comment_by_post_id_cubit.dart';
import 'features/presentation/cubit/user/auth/auth_cubit.dart';
import 'features/presentation/cubit/user/change_password/change_password_cubit.dart';
import 'features/presentation/cubit/user/create_new_password/create_new_password_cubit.dart';
import 'features/presentation/cubit/user/credential/credential_cubit.dart';
import 'features/presentation/cubit/user/forgot_password/forgot_password_cubit.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory(() => AuthCubit(
        loginUserUseCase: locator.call(),
        getCurrentTokenUseCase: locator.call(),
        isSignInUseCase: locator.call(),
      ));

  locator.registerFactory(() => CredentialCubit(
        loginUserUseCase: locator.call(),
        signUpUserUseCase: locator.call(),
      ));
  locator.registerFactory(() => ForgotPasswordCubit(
        forgotPasswordUseCase: locator.call(),
      ));
  locator.registerFactory(() => CreateNewPasswordCubit(
        resetPasswordUseCase: locator.call(),
      ));
  locator.registerFactory(() => GetPostsCubit(
        fetchPostsUseCase: locator.call(),
      ));
  locator.registerFactory(() => GetMessagesCubit(
        getMessageUseCase: locator.call(),
      ));
  locator.registerFactory(() => WebSocketCubit(
        locator.call(),
      ));
  locator.registerFactory(() => SearchPostsUsersCubit(
        searchPostsAndUsersUseCase: locator.call(),
      ));
  locator.registerFactory(() => GetCommentByPostIdCubit(
        fetchCommentsByPostIdUseCase: locator.call(),
      ));
  locator.registerFactory(() => CreateCommentCubit(
        createCommentUseCase: locator.call(),
      ));
  locator.registerFactory(() => ReactionPostCubit(
        reactPostUseCase: locator.call(),
      ));
  locator.registerFactory(() => GetPostsUserCubit(
        fetchPostsUserUseCase: locator.call(),
      ));
  locator.registerFactory(() => ChangePasswordCubit(
        changePasswordUserUseCase: locator.call(),
      ));

  ///Use Case
  locator.registerLazySingleton(
      () => LoginUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => RegisterUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => GetCurrentTokenUseCase(repository: locator.call()));
  locator
      .registerLazySingleton(() => IsSignInUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => ChangePasswordUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => ForgotPasswordUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => ResetPasswordUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchPostsUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchPostsUserUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => GetMessageUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => CreateMessageUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => SearchPostsAndUsersUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => FetchCommentsByPostIdUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => CreateCommentUseCase(repository: locator.call()));
  locator.registerLazySingleton(
      () => ReactPostUseCase(repository: locator.call()));

  ///Repository
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(remoteDataSourceImpl: locator.call()),
  );

  ///Data Source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator.call(),
    ),
  );

  locator.registerLazySingleton<RemoteDataSourceImpl>(
    () => RemoteDataSourceImpl(
      client: locator.call(),
    ),
  );

  ///External
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<WebSocketService>(
      () => WebSocketService("ws://213.130.144.203:8084/ws/messages"));
}
