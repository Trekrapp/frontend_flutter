import 'package:trekr_second/features/domain/entities/reaction-post/reaction_post_entity.dart';

class ReactionPostModel extends ReactionPostEntity {
  int? id;
  String? type;
  String? createdAt;
  int? postId;
  int? commentId;
  int? userId;

  ReactionPostModel(
      {this.id,
      this.type,
      this.createdAt,
      this.postId,
      this.commentId,
      this.userId});

  ReactionPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    createdAt = json['createdAt'];
    postId = json['postId'];
    commentId = json['commentId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['postId'] = postId;
    data['commentId'] = commentId;
    data['userId'] = userId;
    return data;
  }
}
