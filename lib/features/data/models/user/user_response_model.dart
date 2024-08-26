import 'package:trekr_second/features/data/models/user/authorities_model.dart';
import 'package:trekr_second/features/domain/entities/user/user_response_entity.dart';

class UserResponseModel extends UserResponseEntity {
  int? id;
  String? username;
  String? email;
  String? birthday;
  String? location;
  String? phone;
  List<AuthoritiesModel>? authorities;
  bool? enabled;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;

  UserResponseModel(
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

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    birthday = json['birthday'];
    location = json['location'];
    phone = json['phone'];
    if (json['authorities'] != null) {
      authorities = <AuthoritiesModel>[];
      json['authorities'].forEach((v) {
        authorities!.add(AuthoritiesModel.fromJson(v));
      });
    }
    enabled = json['enabled'];
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['birthday'] = birthday;
    data['location'] = location;
    data['phone'] = phone;
    if (authorities != null) {
      data['authorities'] = authorities!.map((v) => v.toJson()).toList();
    }
    data['enabled'] = enabled;
    data['accountNonExpired'] = accountNonExpired;
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    return data;
  }
}
