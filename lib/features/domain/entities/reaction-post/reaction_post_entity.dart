import 'package:equatable/equatable.dart';

class ReactionPostEntity extends Equatable {
  final int? id;
  final String? type;
  final String? createdAt;
  final int? postId;
  final int? commentId;
  final int? userId;

  const ReactionPostEntity(
      {this.id,
      this.type,
      this.createdAt,
      this.postId,
      this.commentId,
      this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [id, type, createdAt, postId, commentId, userId];
}
