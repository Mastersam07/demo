import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view_models/conversations_vm.dart';
import 'chat_details.dart';
import '../../view_models/helpers.dart';

class ConversationsView extends StatefulWidget {
  const ConversationsView({Key? key}) : super(key: key);

  @override
  State<ConversationsView> createState() => _ConversationsViewState();
}

class _ConversationsViewState extends State<ConversationsView> {
  late ConversationViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<ConversationViewModel>();
    vm.addListener(() {
      if (mounted) setState(() {});
    });
    vm.getconversations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversations"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var data = vm.conversations[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatView(conversation: data)),
              );
            },
            enableFeedback: true,
            leading: const CircleAvatar(
              child: FlutterLogo(),
            ),
            title: Text(data.topic?.capitalizeFirstofEach ?? ""),
            subtitle: Text(data.lastMessage ?? ""),
            trailing: Text(DateFormat('HH:mm').format(data.modifiedAt!)),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 8,
          thickness: 1.0,
        ),
        itemCount: vm.conversations.length,
      ),
    );
  }
}
