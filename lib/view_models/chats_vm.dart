import 'package:flutter/material.dart';
import 'package:idnet/view_models/helpers.dart';

import '../models/messages.dart';
import '../services/conversation_service.dart';
import 'base_vm.dart';

// TODO: GROUP THE MESSAGES BY DAY

class ChatViewModel extends AppViewModel {
  final ConversationService service;
  ChatViewModel({required this.service});

  final ScrollController scrollController = ScrollController();

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
    setState(ViewState.idle);
  }

  Future<void> sendChat(String message) async {
    var sentMessage = Messages(
      id: (int.parse(_messages.last.id!) + 1).toString(),
      message: message,
      modifiedAt: DateTime.now(),
      sender: "You",
    );
    _messages.add(sentMessage);
    scrollDown();
    setState(ViewState.idle);
    await service.sendMessage(sentMessage, _convoId!);
    getChats();
  }
}
