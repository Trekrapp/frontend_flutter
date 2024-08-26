import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/use_cases/auth/get_current_token_use_case.dart';
import '../../../../domain/use_cases/auth/is_sign_in_use_case.dart';
import '../../../../domain/use_cases/auth/login_user_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUserUseCase loginUserUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentTokenUseCase getCurrentTokenUseCase;
  AuthCubit(
      {required this.loginUserUseCase,
      required this.getCurrentTokenUseCase,
      required this.isSignInUseCase})
      : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSignInUseCase.callback();
      if (isSignIn == true) {
        final token = await getCurrentTokenUseCase.callback();
        print("this is token $token");
        emit(Authenticated(token: token));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final token = await getCurrentTokenUseCase.callback();
      print("this is token $token");
      emit(Authenticated(token: token));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
