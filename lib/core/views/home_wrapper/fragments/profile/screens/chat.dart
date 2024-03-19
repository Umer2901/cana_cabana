import 'dart:convert';

import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );
  List<types.Message> _messages = [];
  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  void initState() {
    _loadMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: const Text(
          "Support",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontFamily: AppFont.montserrat,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Chat(
        onSendPressed: _handleSendPressed,
        messages: _messages,
        user: _user,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        inputOptions: const InputOptions(
          keyboardType: TextInputType.name,
        ),
        theme: const DefaultChatTheme(
          dateDividerTextStyle: TextStyle(
              fontSize: 12,
              decoration: TextDecoration.none,
              fontFamily: AppFont.montserrat),
          primaryColor: AppColors.primaryColor,
          sentMessageLinkTitleTextStyle: TextStyle(
            color: AppColors.primaryColor,
          ),
          receivedMessageBodyTextStyle: TextStyle(
            color: AppColors.primaryColor,
          ),
          sentMessageCaptionTextStyle: TextStyle(
            color: AppColors.grey,
            decoration: TextDecoration.none,
            fontFamily: AppFont.montserrat,
            fontSize: 12,
          ),
          sentMessageBodyTextStyle: TextStyle(
            color: AppColors.white,
            decoration: TextDecoration.none,
            fontFamily: AppFont.montserratBold,
            fontSize: 15,
          ),
        ),
        textMessageBuilder: (types.TextMessage message,
            {required messageWidth, required bool showName}) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.author == _user
                    ? AppColors.white
                    : AppColors.darkDotColor,
                decoration: TextDecoration.none,
                fontFamily: AppFont.montserrat,
                fontSize: 15,
              ),
            ),
          );
        },
        textMessageOptions: const TextMessageOptions(),
      ),
    );
  }
}
