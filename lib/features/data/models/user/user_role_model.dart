import 'package:trekr_second/features/domain/entities/user/user_role_entity.dart';

class UserRoleModel extends UserRoleEntity {
  int? id;
  String? name;

  UserRoleModel({this.id, this.name});

  UserRoleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
