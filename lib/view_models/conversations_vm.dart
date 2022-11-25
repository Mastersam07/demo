import 'package:idnet/models/indox.dart';

import '../services/conversation_service.dart';
import '../core/base_vm.dart';

class ConversationViewModel extends AppViewModel {
  final ConversationService service;
  ConversationViewModel({required this.service});

  List<Conversation> _conversations = [];
  List<Conversation> get conversations => _conversations;

  Future<void> getconversations() async {
    var data = await service.fetchConversations();
    _conversations = data.reversed.toList();
    notifyListeners();
  }
}
