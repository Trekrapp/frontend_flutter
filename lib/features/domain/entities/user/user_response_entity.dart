import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/user/authorities_entity.dart';

class UserResponseEntity extends Equatable {
  final int? id;
  final String? username;
  final String? email;
  final String? birthday;
  final String? location;
  final String? phone;
  final List<AuthoritiesEntity>? authorities;
  final bool? enabled;
  final bool? accountNonExpired;
  final bool? accountNonLocked;
  final bool? credentialsNonExpired;

  const UserResponseEntity(
      {this.id,
      this.username,
      this.email,
      this.birthday,
      this.location,
      this.phone,
      this.authorities,
      this.enabled,
      this.accountNonExpired,
      this.accountNonLocked,
      this.credentialsNonExpired});
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        username,
        email,
        birthday,
        location,
        phone,
        authorities,
        enabled,
        accountNonExpired,
        accountNonLocked,
        credentialsNonExpired
      ];
}
