import 'package:trekr_second/features/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  int? id;
  String? username;
  String? email;
  List<String>? roles;
  String? accessToken;
  String? tokenType;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.roles,
      this.accessToken,
      this.tokenType});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['roles'] = roles;
    data['accessToken'] = accessToken;
    data['tokenType'] = tokenType;
    return data;
  }
}
