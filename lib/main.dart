import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/views/conversation_view.dart';
import 'services/conversation_service.dart';
import 'view_models/chats_vm.dart';
import 'view_models/conversations_vm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final convoService = ConversationService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (c) => ConversationViewModel(service: convoService)),
        ChangeNotifierProvider(
            create: (c) => ChatViewModel(service: convoService)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ConversationsView(),
      ),
    );
  }
}
