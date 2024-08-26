import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/use_cases/auth/forgot_password_use_case.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  ForgotPasswordCubit({required this.forgotPasswordUseCase})
      : super(ForgotPasswordInitial());

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    try {
      final result = await forgotPasswordUseCase.callback(email);
      print("this is email $email");
      result.fold((l) => emit(ForgotPasswordFailure(message: l.message)),
          (r) => emit(ForgotPasswordLoaded()));
    } on SocketException catch (e) {
      print("this is error $e");
      print("this is email $email ");
      emit(ForgotPasswordFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      print("this is email $email");
      emit(ForgotPasswordFailure(message: e.toString()));
    }
  }
}
