import 'package:equatable/equatable.dart';

class RequestUpdateProfileEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? birthday;
  final String? country;
  final String? phone;

  const RequestUpdateProfileEntity(
      {this.firstName, this.lastName, this.birthday, this.country, this.phone});
  @override
  // TODO: implement props
  List<Object?> get props => [firstName, lastName, birthday, country, phone];
}
