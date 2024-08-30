import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/posts/post_entity.dart';
import 'package:trekr_second/features/domain/use_cases/posts/fetch_posts_user_use_case.dart';

part 'get_posts_user_state.dart';

class GetPostsUserCubit extends Cubit<GetPostsUserState> {
  final FetchPostsUserUseCase fetchPostsUserUseCase;
  GetPostsUserCubit({required this.fetchPostsUserUseCase})
      : super(GetPostsUserInitial());

  Future<void> fetchPostsUser() async {
    emit(GetPostsUserLoading());
    try {
      final result = await fetchPostsUserUseCase.callback();
      result.fold((l) => emit(GetPostsUserFailure(message: l.message)),
          (r) => emit(GetPostsUserLoaded(postsUser: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetPostsUserFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetPostsUserFailure(message: e.toString()));
    }
  }
}
