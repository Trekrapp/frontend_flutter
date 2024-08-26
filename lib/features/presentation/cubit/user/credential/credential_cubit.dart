import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/user/request_body_register_entity.dart';

import '../../../../domain/use_cases/auth/login_user_use_case.dart';
import '../../../../domain/use_cases/auth/register_user_use_case.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final LoginUserUseCase loginUserUseCase;
  final RegisterUserUseCase signUpUserUseCase;
  CredentialCubit(
      {required this.loginUserUseCase, required this.signUpUserUseCase})
      : super(CredentialInitial());

  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(CredentialLoading());
    try {
      await loginUserUseCase.callback(email, password);
      print("this is email $email and this is password $password");
      emit(CredentialSuccess());
    } on SocketException catch (e) {
      print("this is error $e");
      print("this is email $email and this is password $password");
      emit(CredentialFailure());
    } catch (e) {
      print("this is error $e");
      print("this is email $email and this is password $password");
      emit(CredentialFailure());
    }
  }

  Future<void> signUpUser({required RequestBodyRegisterEntity requests}) async {
    emit(CredentialLoading());
    try {
      await signUpUserUseCase.callback(requests);
      print("this is request body $requests ");
      emit(CredentialSuccess());
    } on SocketException catch (e) {
      print("this is error $e");
      print("this is request $requests");
      emit(CredentialFailure());
    } catch (e) {
      print("this is error $e");
      print("this is request $requests");
      emit(CredentialFailure());
    }
  }
}
