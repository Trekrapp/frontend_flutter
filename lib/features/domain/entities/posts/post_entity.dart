import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/posts/media_url_entity.dart';

import '../user/user_posts_response_entity.dart';

class PostEntity extends Equatable {
  final int? id;
  final String? content;
  final String? createdAt;
  final List<MediaUrlEntity>? mediaUrls;
  final UserPostsResponseEntity? user;
  final int? commentCount;
  final int? likeCount;
  const PostEntity(
      {this.id,
      this.content,
      this.createdAt,
      this.mediaUrls,
      this.user,
      this.commentCount,
      this.likeCount});

  @override
  // TODO: implement props
  List<Object?> get props => [id, content, createdAt, mediaUrls];
}
