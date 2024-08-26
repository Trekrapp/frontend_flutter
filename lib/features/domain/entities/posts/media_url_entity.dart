import 'package:equatable/equatable.dart';

class MediaUrlEntity extends Equatable {
  final int? id;
  final String? type;
  final String? url;

  const MediaUrlEntity({this.id, this.type, this.url});
  @override
  // TODO: implement props
  List<Object?> get props => [id, type, url];
}
