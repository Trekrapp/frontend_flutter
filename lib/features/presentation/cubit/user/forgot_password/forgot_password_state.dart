part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

final class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

final class ForgotPasswordLoading extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

final class ForgotPasswordLoaded extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

final class ForgotPasswordFailure extends ForgotPasswordState {
  final String message;

  const ForgotPasswordFailure({required this.message});
  @override
  List<Object> get props => [message];
}
