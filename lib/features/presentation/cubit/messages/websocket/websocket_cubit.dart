import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/helpers/websockets.dart';

part 'websocket_state.dart';

class WebSocketCubit extends Cubit<String> {
  final WebSocketService webSocketService;

  WebSocketCubit(this.webSocketService) : super('') {
    try {
      webSocketService.stream.listen(
        (message) {
          if (!isClosed) {
            emit(message);
          }
        },
        onError: (error) {
          if (!isClosed) {
            emit('Error: $error');
            print('Stream error: $error');
          }
        },
      );
    } catch (e) {
      emit('Error while creating WebSocketCubit: $e');
      print('Cubit initialization error: $e');
    }
  }

  void sendMessage(String message) {
    if (!isClosed) {
      try {
        webSocketService.sendMessage(message);
      } catch (e) {
        print('Error sending message: $e');
      }
    }
  }

  @override
  Future<void> close() {
    webSocketService.close();
    return super.close();
  }
}
