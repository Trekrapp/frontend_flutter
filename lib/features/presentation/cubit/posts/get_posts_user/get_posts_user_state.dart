part of 'get_posts_user_cubit.dart';

sealed class GetPostsUserState extends Equatable {
  const GetPostsUserState();
}

final class GetPostsUserInitial extends GetPostsUserState {
  @override
  List<Object> get props => [];
}

final class GetPostsUserLoading extends GetPostsUserState {
  @override
  List<Object> get props => [];
}

final class GetPostsUserLoaded extends GetPostsUserState {
  final List<PostEntity> postsUser;

  const GetPostsUserLoaded({required this.postsUser});
  @override
  List<Object> get props => [postsUser];
}

final class GetPostsUserFailure extends GetPostsUserState {
  final String message;

  const GetPostsUserFailure({required this.message});
  @override
  List<Object> get props => [message];
}
