import 'package:trekr_second/features/domain/entities/user/request_update_profile_entity.dart';

class RequestUpdateProfileModel extends RequestUpdateProfileEntity {
  String? firstName;
  String? lastName;
  String? birthday;
  String? country;
  String? phone;

  RequestUpdateProfileModel(
      {this.firstName, this.lastName, this.birthday, this.country, this.phone})
      : super(
          firstName: firstName,
        );

  RequestUpdateProfileModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthday = json['birthday'];
    country = json['country'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['birthday'] = birthday;
    data['country'] = country;
    data['phone'] = phone;
    return data;
  }
}
