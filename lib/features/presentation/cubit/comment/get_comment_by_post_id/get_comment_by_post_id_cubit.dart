import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/comment/comment_entity.dart';
import '../../../../domain/use_cases/comment/fetch_comment_by_post_id_use_case.dart';

part 'get_comment_by_post_id_state.dart';

class GetCommentByPostIdCubit extends Cubit<GetCommentByPostIdState> {
  final FetchCommentsByPostIdUseCase fetchCommentsByPostIdUseCase;
  GetCommentByPostIdCubit({required this.fetchCommentsByPostIdUseCase})
      : super(GetCommentByPostIdInitial());

  Future<void> fetchCommentsByPostId({required int postId}) async {
    emit(GetCommentByPostIdLoading());
    try {
      final result = await fetchCommentsByPostIdUseCase.callback(postId);
      result.fold((l) => emit(GetCommentByPostIdFailure(message: l.message)),
          (r) => emit(GetCommentByPostIdLoaded(comments: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(GetCommentByPostIdFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(GetCommentByPostIdFailure(message: e.toString()));
    }
  }

  int getCommentCount() {
    if (state is GetCommentByPostIdLoaded) {
      return (state as GetCommentByPostIdLoaded).comments.length;
    }
    return 0; // Default count if no data is loaded
  }
}
