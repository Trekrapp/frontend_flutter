import '../../../domain/entities/comment/user_response_comment_entity.dart';

class UserResponseCommentModel extends UserResponseCommentEntity {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? publicProfile;

  UserResponseCommentModel(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.publicProfile});

  UserResponseCommentModel.fromJson(Map<String, dynamic> json) {
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
