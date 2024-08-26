import 'package:dartz/dartz.dart';
import 'package:trekr_second/core/error/failure.dart';
import 'package:trekr_second/features/data/models/messages/message_content_model.dart';
import 'package:trekr_second/features/data/models/user/request_body_register_model.dart';
import 'package:trekr_second/features/data/models/user/request_update_profile_model.dart';
import 'package:trekr_second/features/domain/entities/comment/comment_entity.dart';
import 'package:trekr_second/features/domain/entities/friend-requests/friend_request_entity.dart';
import 'package:trekr_second/features/domain/entities/messages/message_content_entity.dart';
import 'package:trekr_second/features/domain/entities/messages/message_entity.dart';
import 'package:trekr_second/features/domain/entities/posts/feed_entity.dart';
import 'package:trekr_second/features/domain/entities/posts/post_entity.dart';
import 'package:trekr_second/features/domain/entities/reaction-post/reaction_post_entity.dart';
import 'package:trekr_second/features/domain/entities/search/search_entity.dart';
import 'package:trekr_second/features/domain/entities/user/nearby_user_entity.dart';
import 'package:trekr_second/features/domain/entities/user/request_body_register_entity.dart';
import 'package:trekr_second/features/domain/entities/user/request_update_profile_entity.dart';
import 'package:trekr_second/features/domain/entities/user/user_entity.dart';
import 'package:trekr_second/features/domain/entities/user/user_friend_response_entity.dart';
import 'package:trekr_second/features/domain/entities/user/user_response_entity.dart';

import '../../domain/repositories/repository.dart';
import '../data_sources/remote/remote_data_source_impl.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSourceImpl remoteDataSourceImpl;

  RepositoryImpl({required this.remoteDataSourceImpl});
  @override
  Future<Either<Failure, String>> changePassword(
      String oldPassword, String newPassword) async {
    try {
      final result =
          await remoteDataSourceImpl.changePassword(oldPassword, newPassword);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(
      String usernameOrMail, String password) async {
    try {
      final result =
          await remoteDataSourceImpl.loginUser(usernameOrMail, password);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> registerUser(
      RequestBodyRegisterEntity requests) async {
    try {
      final result = await remoteDataSourceImpl
          .registerUser(requests as RequestBodyRegisterModel);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<String> getCurrentToken() async =>
      remoteDataSourceImpl.getCurrentToken();

  @override
  Future<bool> isSignIn() async => remoteDataSourceImpl.isSignIn();

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    try {
      final result = await remoteDataSourceImpl.forgotPassword(email);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      String token, String newPassword) async {
    try {
      final result =
          await remoteDataSourceImpl.resetPassword(token, newPassword);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, UserResponseEntity>> userInformation() async {
    try {
      final result = await remoteDataSourceImpl.userInformation();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> fetchPosts() async {
    try {
      final result = await remoteDataSourceImpl.fetchPosts();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> fetchPostsUser() async {
    try {
      final result = await remoteDataSourceImpl.fetchPostsUser();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> fetchPostsByPostId(
      int postId) async {
    try {
      final result = await remoteDataSourceImpl.fetchPostsByPostId(postId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, FeedEntity>> fetchFeeds(int page, int size) async {
    try {
      final result = await remoteDataSourceImpl.fetchFeed(page, size);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, PostEntity>> createPost(
      String content, String mediaFile) async {
    try {
      final result = await remoteDataSourceImpl.createPost(content, mediaFile);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, CommentEntity>> createComment(
      int postId, String content) async {
    try {
      final result = await remoteDataSourceImpl.createComment(postId, content);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, CommentEntity>> fetchCommentByCommentID(
      int commentId) async {
    try {
      final result = await remoteDataSourceImpl.fetchComment(commentId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> fetchCommentsByPostID(
      int postId) async {
    try {
      final result = await remoteDataSourceImpl.fetchCommentsByPostId(postId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, FriendRequestEntity>> sendFriendRequest(
      int receiverId) async {
    try {
      final result = await remoteDataSourceImpl.sendFriendRequest(receiverId);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, FriendRequestEntity>> respondFriendRequest(
      int requestId, String status) async {
    try {
      final result =
          await remoteDataSourceImpl.respondFriendRequest(requestId, status);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<FriendRequestEntity>>>
      fetchSentFriendRequest() async {
    try {
      final result = await remoteDataSourceImpl.fetchSentFriendRequest();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<FriendRequestEntity>>>
      fetchReceivedFriendRequest() async {
    try {
      final result = await remoteDataSourceImpl.fetchReceivedFriendRequest();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, ReactionPostEntity>> reactPost(
      int postId, String type) async {
    try {
      final result = await remoteDataSourceImpl.reactPost(postId, type);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, ReactionPostEntity>> reactComment(
      int commentId, String type) async {
    try {
      final result = await remoteDataSourceImpl.reactPost(commentId, type);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<NearbyUserEntity>>> fetchNearbyUser(
      double latitude, double longitude, double distance) async {
    try {
      final result = await remoteDataSourceImpl.fetchNearbyUser(
          latitude, longitude, distance);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<UserFriendResponseEntity>>>
      fetchFriendOfUser() async {
    try {
      final result = await remoteDataSourceImpl.fetchFriendsOfUser();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, SearchEntity>> searchPostsAndUsers(
      String query) async {
    try {
      final result = await remoteDataSourceImpl.searchPostsAndUsers(query);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfile(
      RequestUpdateProfileEntity requestUpdateProfile) async {
    try {
      final result = await remoteDataSourceImpl
          .updateProfile(requestUpdateProfile as RequestUpdateProfileModel);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages() async {
    try {
      final result = await remoteDataSourceImpl.getMessages();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure(message: 'An error has occurred'));
    }
  }

  @override
  Future<void> createMessage(MessageContentEntity message) async =>
      remoteDataSourceImpl.createMessage(message as MessageContentModel);
}
