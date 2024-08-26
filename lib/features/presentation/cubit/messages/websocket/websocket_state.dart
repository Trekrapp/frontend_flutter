part of 'websocket_cubit.dart';

sealed class WebsocketState extends Equatable {
  const WebsocketState();
}

final class WebsocketInitial extends WebsocketState {
  @override
  List<Object> get props => [];
}
