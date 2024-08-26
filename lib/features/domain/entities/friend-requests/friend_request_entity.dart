import 'package:equatable/equatable.dart';
import 'package:trekr_second/features/domain/entities/friend-requests/sender_entity.dart';

class FriendRequestEntity extends Equatable {
  final int? id;
  final SenderEntity? sender;
  final SenderEntity? receiver;
  final String? status;

  const FriendRequestEntity({this.id, this.sender, this.receiver, this.status});

  @override
  // TODO: implement props
  List<Object?> get props => [id, sender, receiver, status];
}
