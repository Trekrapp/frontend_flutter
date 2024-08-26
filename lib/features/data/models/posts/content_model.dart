import 'package:trekr_second/features/data/models/posts/media_url_model.dart';
import 'package:trekr_second/features/domain/entities/posts/content_entity.dart';

class ContentModel extends ContentEntity {
  int? id;
  String? content;
  String? createdAt;
  List<MediaUrlsModel>? mediaUrls;

  ContentModel({this.id, this.content, this.createdAt, this.mediaUrls});

  ContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    createdAt = json['createdAt'];
    if (json['mediaUrls'] != null) {
      mediaUrls = <MediaUrlsModel>[];
      json['mediaUrls'].forEach((v) {
        mediaUrls!.add(MediaUrlsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['createdAt'] = createdAt;
    if (mediaUrls != null) {
      data['mediaUrls'] = mediaUrls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
