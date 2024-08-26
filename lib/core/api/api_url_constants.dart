class ApiUrlConstants {
  static const String baseUrl = "http://213.130.144.203:8084/api/";

  ///User

  static const String changePassword = "user/change-password";
  static const String nearbyUser = "user/nearby";
  static const String userInformation = "user/me";
  static const String usersFriends = "user/friends";
  static const String registerUser = "auth/signup";
  static const String loginUser = "auth/signin";
  static const String forgetPassword = "auth/forgot-password";
  static const String resetPassword = "auth/reset-password";
  static const String updateProfile = "user/update-profile";

  ///message controller
  static const String messages = "messages";

  ///Posts
  static const String posts = "posts";
  static const String postsUser = "posts/user";
  static const String createPost = "posts/create";

  ///Comments
  static const String comments = "comments";
  static const String commentsByPostId = "comments/post";

  ///Friend Request
  static const String sendFriendRequest = "friend-requests/send";
  static const String respondFriendRequest = "friend-requests/respond";
  static const String sentFriendRequest = "friend-requests/pending/sent";
  static const String receivedFriendRequest =
      "friend-requests/pending/received";

  ///Reaction Post
  static const String reactPost = "reactions/post";
  static const String reactComment = "reactions/comment";

  ///Search Posts And Users
  static const String search = "search";
}
