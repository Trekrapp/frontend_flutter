import 'package:trekr_second/features/data/models/comment/comment_model.dart';
import 'package:trekr_second/features/data/models/friend-request/friend_request_model.dart';
import 'package:trekr_second/features/data/models/posts/feed_model.dart';
import 'package:trekr_second/features/data/models/posts/post_model.dart';
import 'package:trekr_second/features/data/models/reaction-post/reaction_post_model.dart';
import 'package:trekr_second/features/data/models/search/search_model.dart';
import 'package:trekr_second/features/data/models/user/nearby_user_model.dart';
import 'package:trekr_second/features/data/models/user/request_body_register_model.dart';
import 'package:trekr_second/features/data/models/user/request_update_profile_model.dart';
import 'package:trekr_second/features/data/models/user/user_friends_model.dart';
import 'package:trekr_second/features/data/models/user/user_model.dart';

import '../../models/messages/message_content_model.dart';
import '../../models/messages/message_model.dart';
import '../../models/user/user_response_model.dart';

abstract class RemoteDataSource {
  ///---Start Auth---
  Future<String> registerUser(RequestBodyRegisterModel requests);
  Future<UserModel> loginUser(String usernameOrMail, String password);
  Future<String> changePassword(String oldPassword, String newPassword);
  Future<String> resetPassword(String token, String newPassword);
  Future<String> forgotPassword(String email);
  Future<String> getCurrentToken();
  Future<bool> isSignIn();

  ///---Finish Auth---

  ///---Start User----
  Future<List<NearbyUserModel>> fetchNearbyUser(
      double latitude, double longitude, double distance);
  Future<List<UserFriendsModel>> fetchFriendsOfUser();
  Future<UserResponseModel> userInformation();
  Future<String> updateProfile(RequestUpdateProfileModel requestUpdateProfile);

  ///---Finish User----

  ///---Start Posts---
  Future<List<PostModel>> fetchPosts();
  Future<List<PostModel>> fetchPostsUser();
  Future<List<PostModel>> fetchPostsByPostId(int postId);
  Future<FeedModel> fetchFeed(int page, int size);
  Future<PostModel> createPost(String content, String mediaFile);

  ///---Finish Posts---

  ///---Start Comment---
  Future<CommentModel> createComment(int postId, String content);
  Future<CommentModel> fetchComment(int commentId);
  Future<List<CommentModel>> fetchCommentsByPostId(int postId);

  ///---Start Friend Request ---
  Future<FriendRequestModel> sendFriendRequest(int receiverId);
  Future<FriendRequestModel> respondFriendRequest(int requestId, String status);
  Future<List<FriendRequestModel>> fetchSentFriendRequest();
  Future<List<FriendRequestModel>> fetchReceivedFriendRequest();

  ///---Finish Friend Request ---

  ///---Start Reaction Post ---
  Future<ReactionPostModel> reactPost(int postId, String type);
  Future<ReactionPostModel> reactComment(int commentId, String type);

  ///---Start Search---
  Future<SearchModel> searchPostsAndUsers(String query);

  ///---Finish Search---

  ///---Start Search---
  Future<List<MessageModel>> getMessages();
  Future<void> createMessage(MessageContentModel message);

  ///---Finish Search---
}
