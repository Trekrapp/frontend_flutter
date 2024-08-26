import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/reaction-post/reaction_post_entity.dart';

import '../../../../domain/use_cases/reaction-post/react_post_use_case.dart';

part 'reaction_post_state.dart';

class ReactionPostCubit extends Cubit<ReactionPostState> {
  final ReactPostUseCase reactPostUseCase;
  ReactionPostCubit({required this.reactPostUseCase})
      : super(ReactionPostInitial());

  Future<void> reactPosts({required int postId, required String type}) async {
    int _likeCount = 0; // Track the like count locally
    emit(ReactionPostLoading());
    try {
      final result = await reactPostUseCase.callback(postId, type);
      if (type == "LIKE") {
        _likeCount += 1; // Increment like count
      } else if (type == "UNLIKE") {
        _likeCount -= 1; // Decrement like count
      }
      result.fold(
          (l) => emit(ReactionPostFailure(message: l.message)),
          (r) =>
              emit(ReactionPostLoaded(reactionPost: r, likeCount: _likeCount)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(ReactionPostFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(ReactionPostFailure(message: e.toString()));
    }
  }
}
