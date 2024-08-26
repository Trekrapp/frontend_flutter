part of 'create_new_password_cubit.dart';

sealed class CreateNewPasswordState extends Equatable {
  const CreateNewPasswordState();
}

final class CreateNewPasswordInitial extends CreateNewPasswordState {
  @override
  List<Object> get props => [];
}

final class CreateNewPasswordLoading extends CreateNewPasswordState {
  @override
  List<Object> get props => [];
}

final class CreateNewPasswordLoaded extends CreateNewPasswordState {
  @override
  List<Object> get props => [];
}

final class CreateNewPasswordFailure extends CreateNewPasswordState {
  final String message;

  const CreateNewPasswordFailure({required this.message});
  @override
  List<Object> get props => [message];
}
