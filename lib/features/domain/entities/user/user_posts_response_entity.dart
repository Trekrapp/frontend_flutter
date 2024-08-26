import 'package:equatable/equatable.dart';

class UserPostsResponseEntity extends Equatable {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final bool? publicProfile;
  final String? profileImageUrl;

  const UserPostsResponseEntity(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.publicProfile,
      this.profileImageUrl});
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        username,
        firstName,
        lastName,
        email,
        phone,
        publicProfile,
        profileImageUrl
      ];
}
