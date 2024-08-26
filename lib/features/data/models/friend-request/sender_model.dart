import 'package:trekr_second/features/domain/entities/friend-requests/sender_entity.dart';

class SenderModel extends SenderEntity {
  int? id;
  String? username;
  Null? firstName;
  Null? lastName;
  String? email;
  String? phone;
  bool? publicProfile;

  SenderModel(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.publicProfile});

  SenderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    publicProfile = json['publicProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['publicProfile'] = publicProfile;
    return data;
  }
}
