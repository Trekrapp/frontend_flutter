import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/search/search_entity.dart';
import '../../../../domain/use_cases/search/search_posts_and_users_use_case.dart';

part 'search_posts_users_state.dart';

class SearchPostsUsersCubit extends Cubit<SearchPostsUsersState> {
  final SearchPostsAndUsersUseCase searchPostsAndUsersUseCase;
  SearchPostsUsersCubit({required this.searchPostsAndUsersUseCase})
      : super(SearchPostsUsersInitial());

  Future<void> searchPostsAndUsers({required String query}) async {
    emit(SearchPostsUsersLoading());
    try {
      final result = await searchPostsAndUsersUseCase.callback(query);
      result.fold((l) => emit(SearchPostsUsersFailure(message: l.message)),
          (r) => emit(SearchPostsUsersLoaded(results: r)));
    } on SocketException catch (e) {
      print("this is error $e");
      emit(SearchPostsUsersFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      emit(SearchPostsUsersFailure(message: e.toString()));
    }
  }
}
