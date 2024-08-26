import 'package:trekr_second/features/data/models/posts/media_url_model.dart';
import 'package:trekr_second/features/data/models/user/user_posts_response_model.dart';
import 'package:trekr_second/features/domain/entities/posts/post_entity.dart';

class PostModel extends PostEntity {
  int? id;
  String? content;
  String? createdAt;
  List<MediaUrlsModel>? mediaUrls;
  UserPostsResponseModel? user;
  int? commentCount;
  int? likeCount;
  PostModel({this.id, this.content, this.createdAt, this.mediaUrls});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    createdAt = json['createdAt'];
    if (json['mediaUrls'] != null) {
      mediaUrls = <MediaUrlsModel>[];
      json['mediaUrls'].forEach((v) {
        mediaUrls!.add(MediaUrlsModel.fromJson(v));
      });
    }
    user = json['user'] != null
        ? new UserPostsResponseModel.fromJson(json['user'])
        : null;
    commentCount = json['commentCount'];
    likeCount = json['likeCount'];
  }

  static List<PostModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PostModel.fromJson(json)).toList();
  }
}
