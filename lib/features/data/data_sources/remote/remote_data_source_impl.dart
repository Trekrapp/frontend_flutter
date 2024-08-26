import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trekr_second/features/data/data_sources/remote/remote_data_source.dart';
import 'package:trekr_second/features/data/models/comment/comment_model.dart';
import 'package:trekr_second/features/data/models/friend-request/friend_request_model.dart';
import 'package:trekr_second/features/data/models/messages/message_content_model.dart';
import 'package:trekr_second/features/data/models/messages/message_model.dart';
import 'package:trekr_second/features/data/models/posts/feed_model.dart';
import 'package:trekr_second/features/data/models/posts/post_model.dart';
import 'package:trekr_second/features/data/models/reaction-post/reaction_post_model.dart';
import 'package:trekr_second/features/data/models/search/search_model.dart';
import 'package:trekr_second/features/data/models/user/nearby_user_model.dart';
import 'package:trekr_second/features/data/models/user/request_body_register_model.dart';
import 'package:trekr_second/features/data/models/user/request_update_profile_model.dart';
import 'package:trekr_second/features/data/models/user/user_friends_model.dart';
import 'package:trekr_second/features/data/models/user/user_model.dart';
import 'package:trekr_second/features/data/models/user/user_response_model.dart';

import '../../../../core/api/api_url_constants.dart';
import '../../../../core/utils/helpers/websockets.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio client;
  final WebSocketService? webSocketService;
  RemoteDataSourceImpl({required this.client, this.webSocketService});
  @override
  Future<String> changePassword(String oldPassword, String newPassword) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");

    final response = await client.post(
      "${ApiUrlConstants.baseUrl}${ApiUrlConstants.changePassword}",
      data: {"oldPassword": oldPassword, "newPassword": newPassword},
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    print("${ApiUrlConstants.baseUrl}${ApiUrlConstants.changePassword}");
    print("status code ${response.statusCode}");
    print("old password: $oldPassword new password: $newPassword");

    if (response.statusCode == 200) {
      try {
        // Attempt to parse the response as JSON
        final jsonResponse = jsonDecode(response.data);
        print(jsonResponse);
        return jsonResponse; // Return the decoded JSON data
      } catch (e) {
        // If parsing fails, handle as plain text
        print('Response is not JSON: ${response.data}');
        return response.data; // Return the raw response data
      }
    } else {
      throw Exception('Failed to change password');
    }
  }

  @override
  Future<UserModel> loginUser(String usernameOrMail, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await client.post(
      "${ApiUrlConstants.baseUrl}${ApiUrlConstants.loginUser}",
      data: {"usernameOrEmail": usernameOrMail, "password": password},
      options: Options(
        headers: {
          'Accept': 'application/json',
          "Content-Type": "application/json"
        },
        validateStatus: (status) {
          return status! < 500; // Validate status codes less than 500
        },
      ),
    );
    print("${ApiUrlConstants.baseUrl}${ApiUrlConstants.loginUser}");
    print(response.statusCode);
    print("this is login $usernameOrMail and this is password $password");
    print(response.data);
    if (response.statusCode == 200) {
      print(response.data['accessToken']);
      await preferences.setString("token", response.data['accessToken']);
      await preferences.setString("username", response.data['username']);
      await preferences.setString("email", response.data['email']);
      await preferences.setInt("userId", response.data['id']);
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Failed to login user');
    }
  }

  @override
  Future<String> registerUser(RequestBodyRegisterModel requests) async {
    try {
      final response = await client.post(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.registerUser}",
        data: requests.toJson(),
        options: Options(headers: {
          'Accept': 'application/json',
          "Content-Type": "application/json"
        }),
      );
      print(
          "Request URL: ${ApiUrlConstants.baseUrl}${ApiUrlConstants.registerUser}");
      print("Request Payload: ${requests.toJson()}");
      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 201) {
        final responseData = response.data;
        return responseData['message'];
      } else {
        throw Exception('Failed to register user: ${response.data}');
      }
    } on DioException catch (e) {
      print("DioException: ${e.response?.data}");
      throw Exception('Failed to register user: ${e.response?.data}');
    } catch (e) {
      throw Exception('Failed to register user: ${e.toString()}');
    }
  }

  @override
  Future<String> getCurrentToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print("token $token");
    return token;
  }

  @override
  Future<bool> isSignIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print("token $token");
    if (token != "") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> forgotPassword(String email) async {
    final response = await client.post(
      "${ApiUrlConstants.baseUrl}${ApiUrlConstants.forgetPassword}?email=$email",
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    print(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.forgetPassword}?email=$email");
    print("status code ${response.statusCode}");
    print("email: $email ");

    if (response.statusCode == 200) {
      print("Password reset token already sent successfully");
      return "Password reset token already sent successfully";
    } else {
      throw Exception('Failed to change password');
    }
  }

  @override
  Future<String> resetPassword(String token, String newPassword) async {
    final response = await client.post(
      "${ApiUrlConstants.baseUrl}${ApiUrlConstants.resetPassword}?token=$token&newPassword=$newPassword",
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    print(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.resetPassword}?token=$token&newPassword=$newPassword");
    print("status code ${response.statusCode}");
    print("token: $token new password: $newPassword");

    if (response.statusCode == 200) {
      print("Password reset successfully");
      return "Password reset successfully";
    } else {
      throw Exception('Failed to change password');
    }
  }

  @override
  Future<UserResponseModel> userInformation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    final response = await client.get(
      "${ApiUrlConstants.baseUrl}${ApiUrlConstants.userInformation}",
      options: Options(
        headers: {"Authorization": "Bearer $token"},
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    print("${ApiUrlConstants.baseUrl}${ApiUrlConstants.userInformation}");
    print("status code ${response.statusCode}");
    print("token: $token ");

    if (response.statusCode == 200) {
      print("Password reset successfully");
      print("Data: ${response.data}");
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Failed to change password');
    }
  }

  @override
  Future<List<PostModel>> fetchPosts() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response =
        await client.get("${ApiUrlConstants.baseUrl}${ApiUrlConstants.posts}",
            options: Options(headers: {
              "Authorization": "Bearer $token",
              'Content-Type': 'application/json',
            }));
    print("Status Code Formation by status: ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return PostModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<List<PostModel>> fetchPostsUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.postsUser}",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        }));
    print("Status Code Formation by status: ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return PostModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<List<PostModel>> fetchPostsByPostId(int postId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.posts}/$postId",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        }));
    print("Status Code Formation by status: ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return PostModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<FeedModel> fetchFeed(int page, int size) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.posts}/feed?page=$page&size=$size",
        options: Options(headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        }));
    print("Status Code Formation by status: ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return FeedModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<PostModel> createPost(String content, String mediaFile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.post(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.createPost}?content=$content",
        data: FormData.fromMap({
          'mediaFile':
              await MultipartFile.fromFile(mediaFile, filename: 'upload.jpg'),
        }),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            'Accept': 'application/json',
            "Content-Type": "multipart/form-data"
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Create Post: ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return PostModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<CommentModel> createComment(int postId, String content) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    int userId = preferences.getInt("userId")!;
    print('token in register $token');
    final response = await client.post(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.comments}?postId=$postId&userId=$userId",
        data: {"content": content},
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            'Accept': 'application/json',
            "Content-Type": "application/json"
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Create Comment: ${response.statusCode}");
    if (response.statusCode == 201) {
      print(response.data);
      return CommentModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<CommentModel> fetchComment(int commentId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.comments}/$commentId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Create Comment: ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return CommentModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<List<CommentModel>> fetchCommentsByPostId(int postId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.commentsByPostId}/$postId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Create Comment: ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return CommentModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<FriendRequestModel> sendFriendRequest(int receiverId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.post(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.sendFriendRequest}?receiverId=$receiverId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Create Comment: ${response.statusCode}");
    if (response.statusCode == 201) {
      print(response.data);
      return FriendRequestModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<FriendRequestModel> respondFriendRequest(
      int requestId, String status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.post(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.respondFriendRequest}?requestId=$requestId&status=$status",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return FriendRequestModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<List<FriendRequestModel>> fetchSentFriendRequest() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.sentFriendRequest}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return FriendRequestModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<List<FriendRequestModel>> fetchReceivedFriendRequest() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.receivedFriendRequest}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return FriendRequestModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<ReactionPostModel> reactPost(int postId, String type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.post(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.reactPost}?postId=$postId&type=$type",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return ReactionPostModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<ReactionPostModel> reactComment(int commentId, String type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.post(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.reactComment}?commentId=$commentId&type=$type",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return ReactionPostModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<List<NearbyUserModel>> fetchNearbyUser(
      double latitude, double longitude, double distance) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.nearbyUser}?latitude=$latitude&longitude=$longitude&distance=$distance",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return NearbyUserModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<List<UserFriendsModel>> fetchFriendsOfUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.usersFriends}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return UserFriendsModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<SearchModel> searchPostsAndUsers(String query) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    if (token == null) {
      throw Exception('Token not found');
    }
    print('token in register search $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.search}?query=$query",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    print(response.data);
    if (response.statusCode == 200) {
      print(response.data);
      return SearchModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<String> updateProfile(
      RequestUpdateProfileModel requestUpdateProfile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.put(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.updateProfile}",
        data: jsonEncode(requestUpdateProfile),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    print("${ApiUrlConstants.baseUrl}${ApiUrlConstants.updateProfile}");
    print("response :${response.data}");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to update profile');
    }
  }

  @override
  Future<List<MessageModel>> getMessages() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token")!;
    print('token in register $token');
    final response = await client.get(
        "${ApiUrlConstants.baseUrl}${ApiUrlConstants.messages}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ));
    print("Status Code Respond Request Model : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return MessageModel.fromJsonList(response.data);
    } else {
      throw Exception('Failed to load domains');
    }
  }

  @override
  Future<void> createMessage(MessageContentModel message) async {
    final rawMessage = '${message.userId}:${message.content}';
    webSocketService!.sendMessage(rawMessage);
  }
}
