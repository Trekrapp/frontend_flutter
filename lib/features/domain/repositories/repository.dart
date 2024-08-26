import 'package:dartz/dartz.dart';
import 'package:trekr_second/features/domain/entities/comment/comment_entity.dart';
import 'package:trekr_second/features/domain/entities/friend-requests/friend_request_entity.dart';
import 'package:trekr_second/features/domain/entities/messages/message_content_entity.dart';
import 'package:trekr_second/features/domain/entities/messages/message_entity.dart';
import 'package:trekr_second/features/domain/entities/posts/feed_entity.dart';
import 'package:trekr_second/features/domain/entities/posts/post_entity.dart';
import 'package:trekr_second/features/domain/entities/reaction-post/reaction_post_entity.dart';
import 'package:trekr_second/features/domain/entities/search/search_entity.dart';
import 'package:trekr_second/features/domain/entities/user/nearby_user_entity.dart';
import 'package:trekr_second/features/domain/entities/user/user_entity.dart';
import 'package:trekr_second/features/domain/entities/user/user_friend_response_entity.dart';
import 'package:trekr_second/features/domain/entities/user/user_response_entity.dart';

import '../../../core/error/failure.dart';
import '../entities/user/request_body_register_entity.dart';
import '../entities/user/request_update_profile_entity.dart';

abstract class Repository {
  ///---Start Auth----
  Future<Either<Failure, String>> registerUser(
      RequestBodyRegisterEntity requests);
  Future<Either<Failure, UserEntity>> loginUser(
      String usernameOrMail, String password);
  Future<Either<Failure, String>> changePassword(
      String oldPassword, String newPassword);
  Future<String> getCurrentToken();
  Future<bool> isSignIn();
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, String>> resetPassword(
      String token, String newPassword);

  ///---Finish Auth----

  ///---Start User---
  Future<Either<Failure, UserResponseEntity>> userInformation();
  Future<Either<Failure, List<NearbyUserEntity>>> fetchNearbyUser(
      double latitude, double longitude, double distance);
  Future<Either<Failure, List<UserFriendResponseEntity>>> fetchFriendOfUser();
  Future<Either<Failure, String>> updateProfile(
      RequestUpdateProfileEntity requestUpdateProfile);

  ///---Finish User----

  ///---Start Posts---
  Future<Either<Failure, List<PostEntity>>> fetchPosts();
  Future<Either<Failure, List<PostEntity>>> fetchPostsUser();
  Future<Either<Failure, List<PostEntity>>> fetchPostsByPostId(int postId);
  Future<Either<Failure, FeedEntity>> fetchFeeds(int page, int size);
  Future<Either<Failure, PostEntity>> createPost(
      String content, String mediaUrl);

  ///---Finish Posts---

  ///---Start Comments
  Future<Either<Failure, CommentEntity>> createComment(
      int postId, String content);
  Future<Either<Failure, CommentEntity>> fetchCommentByCommentID(int commentId);
  Future<Either<Failure, List<CommentEntity>>> fetchCommentsByPostID(
      int postId);

  ///---Finish Comments

  ///---Start Friend Requests---
  Future<Either<Failure, FriendRequestEntity>> sendFriendRequest(
      int receiverId);
  Future<Either<Failure, FriendRequestEntity>> respondFriendRequest(
      int requestId, String status);
  Future<Either<Failure, List<FriendRequestEntity>>> fetchSentFriendRequest();
  Future<Either<Failure, List<FriendRequestEntity>>>
      fetchReceivedFriendRequest();

  ///---Finish Friend Requests---

  ///---Start Reaction---
  Future<Either<Failure, ReactionPostEntity>> reactPost(
      int postId, String type);
  Future<Either<Failure, ReactionPostEntity>> reactComment(
      int commentId, String type);

  ///---Finish Reaction---

  ///---Start Search---
  Future<Either<Failure, SearchEntity>> searchPostsAndUsers(String query);

  ///---End Search
  ///---Start Message---
  Future<Either<Failure, List<MessageEntity>>> getMessages();
  Future<void> createMessage(MessageContentEntity message);

  ///---End Message---
}
