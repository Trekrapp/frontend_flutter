import 'package:equatable/equatable.dart';

class UserRoleEntity extends Equatable {
  final int? id;
  final String? name;

  const UserRoleEntity({this.id, this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
