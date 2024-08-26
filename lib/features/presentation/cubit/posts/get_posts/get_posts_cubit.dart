import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/posts/post_entity.dart';
import '../../../../domain/use_cases/posts/fetch_posts_use_case.dart';

part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  final FetchPostsUseCase fetchPostsUseCase;
  GetPostsCubit({required this.fetchPostsUseCase}) : super(GetPostsInitial());
  Future<void> fetchPosts() async {
    emit(GetPostsLoading());
    try {
      final result = await fetchPostsUseCase.callback();
      result.fold((l) => emit(GetPostsFailure(message: l.message)),
          (r) => emit(GetPostsLoaded(posts: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetPostsFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetPostsFailure(message: e.toString()));
    }
  }
}
