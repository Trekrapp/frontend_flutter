part of 'get_posts_cubit.dart';

sealed class GetPostsState extends Equatable {
  const GetPostsState();
}

final class GetPostsInitial extends GetPostsState {
  @override
  List<Object> get props => [];
}

final class GetPostsLoading extends GetPostsState {
  @override
  List<Object> get props => [];
}

final class GetPostsLoaded extends GetPostsState {
  final List<PostEntity> posts;

  const GetPostsLoaded({required this.posts});
  @override
  List<Object> get props => [posts];
}

final class GetPostsFailure extends GetPostsState {
  final String message;

  const GetPostsFailure({required this.message});
  @override
  List<Object> get props => [message];
}
