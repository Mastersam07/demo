import 'package:flutter/material.dart';
import 'package:idnet/view_models/helpers.dart';

import '../models/messages.dart';
import '../services/conversation_service.dart';
import '../core/base_vm.dart';

// TODO: GROUP THE MESSAGES BY DAY
// TODO: SWITCH TO MOCKED WEB SOCKET IMPLEMENTATION
//

class ChatViewModel extends AppViewModel {
  final ConversationService service;
  ChatViewModel({required this.service});

  final ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  // TODO: Better the scrolling experience

  void scrollDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent +
        scrollController.position.maxScrollExtent / 12);
  }

  List<Messages> _messages = [];
  List<Messages> get messages => _messages;

  String? _convoId;
  set convoId(String id) {
    _convoId = id;
  }

  Future<void> getChats() async {
    var data = await service.fetchMessages(_convoId!);
    _messages = data;
    scrollDown();
    setState(ViewState.idle);
  }

  Future<void> sendChat() async {
    var sentMessage = Messages(
      id: (int.parse(_messages.last.id!) + 1).toString(),
      message: messageController.text.trim(),
      modifiedAt: DateTime.now(),
      sender: "You",
    );
    _messages.add(sentMessage);
    messageController.clear();
    scrollDown();
    setState(ViewState.idle);
    await service.sendMessage(sentMessage, _convoId!);
    getChats();
  }
}
