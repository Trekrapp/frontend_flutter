import 'package:equatable/equatable.dart';

class AuthoritiesEntity extends Equatable {
  final String? authority;

  const AuthoritiesEntity({required this.authority});
  @override
  // TODO: implement props
  List<Object?> get props => [authority];
}
