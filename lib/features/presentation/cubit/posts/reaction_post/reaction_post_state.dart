part of 'reaction_post_cubit.dart';

sealed class ReactionPostState extends Equatable {
  const ReactionPostState();
}

final class ReactionPostInitial extends ReactionPostState {
  @override
  List<Object> get props => [];
}

final class ReactionPostLoading extends ReactionPostState {
  @override
  List<Object> get props => [];
}

final class ReactionPostLoaded extends ReactionPostState {
  final int likeCount;
  final ReactionPostEntity reactionPost;

  const ReactionPostLoaded(
      {required this.reactionPost, required this.likeCount});
  @override
  List<Object> get props => [reactionPost];
}

final class ReactionPostFailure extends ReactionPostState {
  final String message;

  const ReactionPostFailure({required this.message});
  @override
  List<Object> get props => [message];
}
