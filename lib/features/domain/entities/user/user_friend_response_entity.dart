import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/user/user_role_entity.dart';

class UserFriendResponseEntity extends Equatable {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? birthday;
  final String? country;
  final String? countryState;
  final String? phone;
  final bool? receiveNotifications;
  final String? verificationToken;
  final bool? verified;
  final int? latitude;
  final int? longitude;
  final List<UserRoleEntity>? roles;
  final List<String>? friends;
  final bool? publicProfile;
  final bool? locationShared;

  const UserFriendResponseEntity(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.birthday,
      this.country,
      this.countryState,
      this.phone,
      this.receiveNotifications,
      this.verificationToken,
      this.verified,
      this.latitude,
      this.longitude,
      this.roles,
      this.friends,
      this.publicProfile,
      this.locationShared});
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        username,
        firstName,
        lastName,
        email,
        password,
        birthday,
        country,
        countryState,
        phone,
        receiveNotifications,
        verificationToken,
        verified,
        latitude,
        longitude,
        roles,
        friends,
        publicProfile,
        locationShared
      ];
}
