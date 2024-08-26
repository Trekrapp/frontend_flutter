import 'package:equatable/equatable.dart';

class NearbyUserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final bool? publicProfile;

  const NearbyUserEntity(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.publicProfile});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, username, firstName, lastName, email, phone, publicProfile];
}
