part of 'search_posts_users_cubit.dart';

sealed class SearchPostsUsersState extends Equatable {
  const SearchPostsUsersState();
}

final class SearchPostsUsersInitial extends SearchPostsUsersState {
  @override
  List<Object> get props => [];
}

final class SearchPostsUsersLoading extends SearchPostsUsersState {
  @override
  List<Object> get props => [];
}

final class SearchPostsUsersLoaded extends SearchPostsUsersState {
  final SearchEntity results;

  const SearchPostsUsersLoaded({required this.results});

  @override
  List<Object> get props => [results];
}

final class SearchPostsUsersFailure extends SearchPostsUsersState {
  final String message;

  const SearchPostsUsersFailure({required this.message});
  @override
  List<Object> get props => [message];
}
