import 'package:trekr_second/features/data/models/friend-request/sender_model.dart';
import 'package:trekr_second/features/domain/entities/friend-requests/friend_request_entity.dart';

class FriendRequestModel extends FriendRequestEntity {
  int? id;
  SenderModel? sender;
  SenderModel? receiver;
  String? status;

  FriendRequestModel({this.id, this.sender, this.receiver, this.status});

  FriendRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender =
        json['sender'] != null ? SenderModel.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? SenderModel.fromJson(json['receiver'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    if (receiver != null) {
      data['receiver'] = receiver!.toJson();
    }
    data['status'] = status;
    return data;
  }

  static List<FriendRequestModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FriendRequestModel.fromJson(json)).toList();
  }
}
