import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/comment/user_response_comment_entity.dart';

class CommentEntity extends Equatable {
  final int? id;
  final String? content;
  final UserResponseCommentEntity? user;

  const CommentEntity({this.id, this.content, this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [id, content, user];
}
