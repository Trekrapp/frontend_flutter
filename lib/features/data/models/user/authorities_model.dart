import 'package:trekr_second/features/domain/entities/user/authorities_entity.dart';

class AuthoritiesModel extends AuthoritiesEntity {
  String? authority;

  AuthoritiesModel({this.authority}) : super(authority: authority);

  factory AuthoritiesModel.fromJson(Map<String, dynamic> json) {
    return AuthoritiesModel(authority: json['authority']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authority'] = authority;
    return data;
  }
}
