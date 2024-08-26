import 'package:trekr_second/features/domain/entities/user/nearby_user_entity.dart';

class NearbyUserModel extends NearbyUserEntity {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? publicProfile;

  NearbyUserModel(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.publicProfile});

  NearbyUserModel.fromJson(Map<String, dynamic> json) {
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

  static List<NearbyUserModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NearbyUserModel.fromJson(json)).toList();
  }
}
