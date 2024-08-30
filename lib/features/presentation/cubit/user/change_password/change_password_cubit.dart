import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/use_cases/auth/change_password_use_case.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUserUseCase changePasswordUserUseCase;
  ChangePasswordCubit({required this.changePasswordUserUseCase})
      : super(ChangePasswordInitial());
  Future<void> resetPassword(
      {required String oldPassword, required String newPassword}) async {
    emit(ChangePasswordLoading());
    try {
      final result =
          await changePasswordUserUseCase.callback(oldPassword, newPassword);
      print("Old Password: $oldPassword and New password: $newPassword");
      result.fold((l) => emit(ChangePasswordFailure(message: l.message)),
          (r) => emit(ChangePasswordLoaded()));
    } on SocketException catch (e) {
      print("this is error $e");
      print("Old Password: $oldPassword and New password: $newPassword");
      emit(ChangePasswordFailure(message: e.toString()));
    } catch (e) {
      print("this is error $e");
      print("Old Password: $oldPassword and New password: $newPassword");
      emit(ChangePasswordFailure(message: e.toString()));
    }
  }
}
