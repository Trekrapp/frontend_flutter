import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/comment/comment_entity.dart';

import '../../../../domain/use_cases/comment/create_comment_use_case.dart';

part 'create_comment_state.dart';

class CreateCommentCubit extends Cubit<CreateCommentState> {
  final CreateCommentUseCase createCommentUseCase;
  CreateCommentCubit({required this.createCommentUseCase})
      : super(CreateCommentInitial());

  Future<void> createComment(
      {required int postId, required String content}) async {
    emit(CreateCommentLoading());
    try {
      final result = await createCommentUseCase.callback(postId, content);
      result.fold((l) => emit(CreateCommentFailure(message: l.message)),
          (r) => emit(CreateCommentLoaded(comment: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(CreateCommentFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(CreateCommentFailure(message: e.toString()));
    }
  }
}
