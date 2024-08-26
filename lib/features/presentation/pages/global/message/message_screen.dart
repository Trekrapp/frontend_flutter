import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trekr_second/core/constants/app_colors.dart';
import 'package:trekr_second/core/utils/helpers/helper_functions.dart';
import 'package:trekr_second/features/domain/entities/messages/message_entity.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../dependencies_injection.dart';
import '../../../../domain/entities/friend-requests/sender_entity.dart';
import '../../../cubit/messages/get_messages/get_messages_cubit.dart';
import '../../../widgets/message/widgets_imports.dart';

class MessageScreen extends StatefulWidget {
  final int loggedInUserId;

  const MessageScreen({super.key, required this.loggedInUserId});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late WebSocketChannel channel;
  final inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<MessageEntity> messageList = [];

  @override
  void initState() {
    super.initState();
    loadMessages();
    connectToWebSocket();
  }

  void loadMessages() async {
    List<MessageEntity> loadedMessages = await loadMessagesFromPreferences();
    setState(() {
      messageList =
          loadedMessages.reversed.toList(); // Reverse the loaded messages
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void saveMessagesToPreferences(List<MessageEntity> messages) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> messagesJson = messages
        .map((message) => jsonEncode({
              'id': message.id,
              'content': message.content,
              'timestamp': message.timestamp,
              'sender': {
                'id': message.sender?.id,
                'username': message.sender?.username,
                'firstName': message.sender?.firstName,
                'lastName': message.sender?.lastName,
                'email': message.sender?.email,
                'phone': message.sender?.phone,
                'publicProfile': message.sender?.publicProfile,
              },
              'recipient': {
                'id': message.recipient?.id,
                'username': message.recipient?.username,
                'firstName': message.recipient?.firstName,
                'lastName': message.recipient?.lastName,
                'email': message.recipient?.email,
                'phone': message.recipient?.phone,
                'publicProfile': message.recipient?.publicProfile,
              },
            }))
        .toList();
    preferences.setStringList('messages', messagesJson);
  }

  Future<List<MessageEntity>> loadMessagesFromPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? messagesJson = preferences.getStringList('messages');
    if (messagesJson == null) return [];

    List<MessageEntity> messages = messagesJson.map((messageString) {
      final messageData = jsonDecode(messageString);
      return MessageEntity(
        id: messageData['id'],
        content: messageData['content'],
        timestamp: messageData['timestamp'],
        sender: SenderEntity(
          id: messageData['sender']['id'],
          username: messageData['sender']['username'],
          firstName: messageData['sender']['firstName'],
          lastName: messageData['sender']['lastName'],
          email: messageData['sender']['email'],
          phone: messageData['sender']['phone'],
          publicProfile: messageData['sender']['publicProfile'],
        ),
        recipient: SenderEntity(
          id: messageData['recipient']['id'],
          username: messageData['recipient']['username'],
          firstName: messageData['recipient']['firstName'],
          lastName: messageData['recipient']['lastName'],
          email: messageData['recipient']['email'],
          phone: messageData['recipient']['phone'],
          publicProfile: messageData['recipient']['publicProfile'],
        ),
      );
    }).toList();
    return messages;
  }

  void connectToWebSocket() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    const webSocketUrl = 'ws://213.130.144.203:8084/ws/messages';

    print('Connecting to WebSocket: $webSocketUrl');
    try {
      channel = IOWebSocketChannel.connect(
        webSocketUrl,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      channel.stream.listen((data) async {
        final messageData = jsonDecode(data);

        setState(() {
          if (data.contains('WebSocket connection closed')) {
            messageList.add(MessageEntity(
              content: 'WebSocket connection closed',
              sender: SenderEntity(id: 0),
              timestamp: DateTime.now().toIso8601String(),
              messageType: MessageType.system,
            ));
          } else {
            final sender = SenderEntity(
              id: messageData['sender']['id'],
              username: messageData['sender']['username'],
              firstName: messageData['sender']['firstName'],
              lastName: messageData['sender']['lastName'],
              email: messageData['sender']['email'],
              phone: messageData['sender']['phone'],
              publicProfile: messageData['sender']['publicProfile'],
            );
            final recipient = SenderEntity(
              id: messageData['recipient']['id'],
              username: messageData['recipient']['username'],
              firstName: messageData['recipient']['firstName'],
              lastName: messageData['recipient']['lastName'],
              email: messageData['recipient']['email'],
              phone: messageData['recipient']['phone'],
              publicProfile: messageData['recipient']['publicProfile'],
            );

            messageList.add(MessageEntity(
              id: messageData['id'],
              content: messageData['content'],
              timestamp: messageData['timestamp'],
              sender: sender,
              recipient: recipient,
              messageType: MessageType.user,
            ));
          }
          saveMessagesToPreferences(messageList);
        });
        WidgetsBinding.instance.addPostFrameCallback((_) =>
            _scrollToBottom()); // Scroll to the bottom when a new message is received
      }, onError: (error) {
        print('WebSocket connection error: $error');
        setState(() {
          messageList.add(MessageEntity(
            content: 'Error connecting to WebSocket: $error',
            sender: SenderEntity(id: 0),
            timestamp: DateTime.now().toIso8601String(),
            messageType: MessageType.system,
          ));
          saveMessagesToPreferences(messageList);
        });
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scrollToBottom()); // Scroll to the bottom on error
      });
    } catch (e) {
      print('Exception while connecting to WebSocket: $e');
      setState(() {
        messageList.add(MessageEntity(
          content: 'Exception while connecting to WebSocket: $e',
          sender: const SenderEntity(id: 0),
          timestamp: DateTime.now().toIso8601String(),
          messageType: MessageType.system,
        ));
        saveMessagesToPreferences(messageList);
      });
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => _scrollToBottom()); // Scroll to the bottom on exception
    }
  }

  @override
  void dispose() {
    print('Disposing WebSocket channel and inputController');
    channel.sink.close();
    inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteSmoke,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: HelperFunctions.screenHeight(context) * .7.h,
              width: HelperFunctions.screenWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    topLeft: Radius.circular(30.r)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.r),
                              topLeft: Radius.circular(30.r),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(AppAssets.avatar),
                                radius: 25.r,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Benjamin Moores",
                                    style: GoogleFonts.poppins(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Dernière connexion à 11h44",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.lightSlateGrey),
                                  ),
                                ],
                              ),
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: const BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: HelperFunctions.screenHeight(context) * .55.h,
                          width: HelperFunctions.screenWidth(context),
                          child: BlocProvider(
                            create: (context) =>
                                locator<GetMessagesCubit>()..fetchMessages(),
                            child:
                                BlocBuilder<GetMessagesCubit, GetMessagesState>(
                              builder: (context, state) {
                                List<MessageEntity> allMessages =
                                    List.from(messageList);

                                if (state is GetMessagesLoaded) {
                                  allMessages.addAll(state.messages.reversed
                                      .toList()); // Add new messages in reverse order
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.only(bottom: 80.h),
                                  controller: _scrollController,
                                  itemCount: allMessages.length,
                                  itemBuilder: (context, index) {
                                    final message = allMessages[index];

                                    if (message.messageType ==
                                        MessageType.system) {
                                      return ListTile(
                                        title: Text(
                                          message.content!,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      );
                                    } else {
                                      final isCurrentUser =
                                          message.sender!.id ==
                                              widget.loggedInUserId;
                                      return BubbleMessage(
                                        message: message,
                                        isCurrentUser: isCurrentUser,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    BottomButton(
                      icon: Icons.camera_alt_outlined,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: TextField(
                        controller: inputController,
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          hintStyle: GoogleFonts.inter(
                              color: Colors.black, fontSize: 15.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    BottomButton(
                      icon: Icons.send,
                      onTap: () {
                        if (inputController.text.isNotEmpty) {
                          print('Sending message: ${inputController.text}');
                          channel.sink.add(inputController.text);
                          setState(() {
                            messageList.add(MessageEntity(
                              content: inputController.text,
                              sender: SenderEntity(id: widget.loggedInUserId),
                              timestamp: DateTime.now().toIso8601String(),
                            ));
                          });
                          inputController.clear();
                          WidgetsBinding.instance.addPostFrameCallback((_) =>
                              _scrollToBottom()); // Scroll to the bottom after sending a message
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ])));
  }
}
