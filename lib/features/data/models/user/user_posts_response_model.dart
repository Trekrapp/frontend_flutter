import '../../../domain/entities/user/user_posts_response_entity.dart';

class UserPostsResponseModel extends UserPostsResponseEntity {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? publicProfile;
  String? profileImageUrl;

  UserPostsResponseModel(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.publicProfile,
      this.profileImageUrl});

  UserPostsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    publicProfile = json['publicProfile'];
    profileImageUrl = json['profileImageUrl'];
  }
}
