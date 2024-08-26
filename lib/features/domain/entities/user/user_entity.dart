import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? email;
  final List<String>? roles;
  final String? accessToken;
  final String? tokenType;

  const UserEntity(
      {this.id,
      this.username,
      this.email,
      this.roles,
      this.accessToken,
      this.tokenType});

  @override
  // TODO: implement props
  List<Object?> get props => [id,
    username,
    email,
    roles,
    accessToken,
    tokenType];
}
