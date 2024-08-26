import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final WebSocketChannel _channel;
  late final Stream<String> _stream;

  WebSocketService(String url)
      : _channel = WebSocketChannel.connect(Uri.parse(url)) {
    _stream =
        _channel.stream.map((event) => event as String).handleError((error) {
      print('Stream error: $error');
    }).asBroadcastStream();
  }

  Stream<String> get stream => _stream;

  void sendMessage(String message) {
    try {
      _channel.sink.add(message);
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  void close() {
    _channel.sink.close();
  }
}
