part of 'change_password_cubit.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();
}

final class ChangePasswordInitial extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

final class ChangePasswordLoading extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

final class ChangePasswordLoaded extends ChangePasswordState {
  @override
  List<Object> get props => [];
}

final class ChangePasswordFailure extends ChangePasswordState {
  final String message;

  ChangePasswordFailure({required this.message});
  @override
  List<Object> get props => [message];
}
