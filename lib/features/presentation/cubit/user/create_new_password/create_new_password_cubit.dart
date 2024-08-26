import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/use_cases/auth/reset_password_use_case.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;
  CreateNewPasswordCubit({required this.resetPasswordUseCase})
      : super(CreateNewPasswordInitial());

  Future<void> resetPassword(
      {required String token, required String newPassword}) async {
    emit(CreateNewPasswordLoading());
    try {
      final result = await resetPasswordUseCase.callback(token, newPassword);
      print("Token: $token and New password: $newPassword");
      result.fold((l) => emit(CreateNewPasswordFailure(message: l.message)),
          (r) => emit(CreateNewPasswordLoaded()));
    } on SocketException catch (e) {
      print("this is error $e");
      print("Token: $token and New password: $newPassword");
      emit(CreateNewPasswordFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      print("Token: $token and New password: $newPassword");
      emit(CreateNewPasswordFailure(message: e.toString()));
    }
  }
}
