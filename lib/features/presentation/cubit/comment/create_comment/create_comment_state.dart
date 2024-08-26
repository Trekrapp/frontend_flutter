part of 'create_comment_cubit.dart';

sealed class CreateCommentState extends Equatable {
  const CreateCommentState();
}

final class CreateCommentInitial extends CreateCommentState {
  @override
  List<Object> get props => [];
}

final class CreateCommentLoading extends CreateCommentState {
  @override
  List<Object> get props => [];
}

final class CreateCommentLoaded extends CreateCommentState {
  final CommentEntity comment;

  const CreateCommentLoaded({required this.comment});
  @override
  List<Object> get props => [comment];
}

final class CreateCommentFailure extends CreateCommentState {
  final String message;

  const CreateCommentFailure({required this.message});
  @override
  List<Object> get props => [message];
}
