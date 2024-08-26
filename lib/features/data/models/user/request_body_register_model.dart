import 'package:trekr_second/features/domain/entities/user/request_body_register_entity.dart';

class RequestBodyRegisterModel extends RequestBodyRegisterEntity {
  String? username;
  String? email;
  String? password;
  String? phone;

  RequestBodyRegisterModel(
      {this.username, this.email, this.password, this.phone});

  RequestBodyRegisterModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}
