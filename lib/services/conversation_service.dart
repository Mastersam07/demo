import 'package:idnet/models/indox.dart';

import '../models/messages.dart';

class ConversationService {
  late List<Map<String, dynamic>> conversationsJson;
  late List<Map<String, dynamic>> chatAJson;
  late List<Map<String, dynamic>> chatBJson;
  late List<Map<String, dynamic>> chatCJson;

  ConversationService(
      {List<Map<String, dynamic>>? group,
      List<Map<String, dynamic>>? groupA,
      List<Map<String, dynamic>>? groupB,
      List<Map<String, dynamic>>? groupC}) {
    conversationsJson = group ?? groupJson;
    chatAJson = groupA ?? firstJson;
    chatBJson = groupB ?? secondJson;
    chatCJson = groupC ?? thirdJson;
  }

  Future<List<Conversation>> fetchConversations() async {
    Future.delayed(const Duration(seconds: 2));
    return List<Conversation>.from(
        conversationsJson.map((e) => Conversation.fromJson(e)));
  }

  Future<List<Messages>> fetchMessages(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    if (id == "9991") {
      return List<Messages>.from(firstJson.map((e) => Messages.fromJson(e)));
    }
    if (id == "9992") {
      return List<Messages>.from(secondJson.map((e) => Messages.fromJson(e)));
    }
    return List<Messages>.from(thirdJson.map((e) => Messages.fromJson(e)));
  }

  Future<void> sendMessage(Messages message, String convoId) async {
    if (convoId == "9991") {
      firstJson.add(message.toJson());
      receiveMessage(convoId);
      return;
    }
    if (convoId == "9992") {
      secondJson.add(message.toJson());
      receiveMessage(convoId);
      return;
    }
    thirdJson.add(message.toJson());
    receiveMessage(convoId);
    return;
  }

  Future<void> receiveMessage(String convoId) async {
    await Future.delayed(const Duration(seconds: 2));
    var message = {
      "id": convoId,
      "message": "A dummy server response",
      "modified_at": DateTime.now().millisecondsSinceEpoch,
      "sender": "Server"
    };
    if (convoId == "9991") {
      firstJson.add(message);
      return;
    }
    if (convoId == "9992") {
      secondJson.add(message);
      return;
    }
    thirdJson.add(message);
    return;
  }
}
