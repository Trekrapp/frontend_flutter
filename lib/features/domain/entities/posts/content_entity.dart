import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/posts/media_url_entity.dart';

class ContentEntity extends Equatable {
  final int? id;
  final String? content;
  final String? createdAt;
  final List<MediaUrlEntity>? mediaUrls;

  const ContentEntity({this.id, this.content, this.createdAt, this.mediaUrls});
  @override
  // TODO: implement props
  List<Object?> get props => [id, content, createdAt, mediaUrls];
}
