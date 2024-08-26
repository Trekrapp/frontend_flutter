import 'package:trekr_second/features/data/models/user/user_role_model.dart';
import 'package:trekr_second/features/domain/entities/user/user_friend_response_entity.dart';

class UserFriendsModel extends UserFriendResponseEntity {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? birthday;
  String? country;
  String? countryState;
  String? phone;
  bool? receiveNotifications;
  String? verificationToken;
  bool? verified;
  int? latitude;
  int? longitude;
  List<UserRoleModel>? roles;
  List<String>? friends;
  bool? publicProfile;
  bool? locationShared;

  UserFriendsModel(
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

  UserFriendsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    birthday = json['birthday'];
    country = json['country'];
    countryState = json['countryState'];
    phone = json['phone'];
    receiveNotifications = json['receiveNotifications'];
    verificationToken = json['verificationToken'];
    verified = json['verified'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['roles'] != null) {
      roles = <UserRoleModel>[];
      json['roles'].forEach((v) {
        roles!.add(UserRoleModel.fromJson(v));
      });
    }
    friends = json['friends'].cast<String>();
    publicProfile = json['publicProfile'];
    locationShared = json['locationShared'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['birthday'] = birthday;
    data['country'] = country;
    data['countryState'] = countryState;
    data['phone'] = phone;
    data['receiveNotifications'] = receiveNotifications;
    data['verificationToken'] = verificationToken;
    data['verified'] = verified;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['friends'] = friends;
    data['publicProfile'] = publicProfile;
    data['locationShared'] = locationShared;
    return data;
  }

  static List<UserFriendsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserFriendsModel.fromJson(json)).toList();
  }
}
