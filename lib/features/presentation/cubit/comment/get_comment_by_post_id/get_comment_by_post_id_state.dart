part of 'get_comment_by_post_id_cubit.dart';

sealed class GetCommentByPostIdState extends Equatable {
  const GetCommentByPostIdState();
}

final class GetCommentByPostIdInitial extends GetCommentByPostIdState {
  @override
  List<Object> get props => [];
}

final class GetCommentByPostIdLoading extends GetCommentByPostIdState {
  @override
  List<Object> get props => [];
}

final class GetCommentByPostIdLoaded extends GetCommentByPostIdState {
  final List<CommentEntity> comments;

  GetCommentByPostIdLoaded({required this.comments});
  @override
  List<Object> get props => [comments];
}

final class GetCommentByPostIdFailure extends GetCommentByPostIdState {
  final String message;

  const GetCommentByPostIdFailure({required this.message});
  @override
  List<Object> get props => [message];
}
