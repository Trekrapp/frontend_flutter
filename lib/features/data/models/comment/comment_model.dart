import 'package:trekr_second/features/data/models/comment/response_user_comment_model.dart';
import 'package:trekr_second/features/domain/entities/comment/comment_entity.dart';

class CommentModel extends CommentEntity {
  int? id;
  String? content;
  UserResponseCommentModel? user;

  CommentModel({this.id, this.content, this.user});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    user = json['user'] != null
        ? UserResponseCommentModel.fromJson(json['user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  static List<CommentModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CommentModel.fromJson(json)).toList();
  }
}
