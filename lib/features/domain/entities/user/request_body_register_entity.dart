import 'package:equatable/equatable.dart';

class RequestBodyRegisterEntity extends Equatable {
  final String? username;
  final String? email;
  final String? password;
  final String? phone;

  const RequestBodyRegisterEntity(
      {this.username, this.email, this.password, this.phone});

  @override
  // TODO: implement props
  List<Object?> get props => [username, email, password, phone];
}
