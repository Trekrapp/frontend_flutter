import 'package:equatable/equatable.dart';

import '../posts/post_entity.dart';
import '../user/nearby_user_entity.dart';

class SearchEntity extends Equatable {
  final List<NearbyUserEntity>? users;
  final List<PostEntity>? posts;

  const SearchEntity({this.users, this.posts});

  @override
  // TODO: implement props
  List<Object?> get props => [users, posts];
}
