import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/base_view.dart';
import '../../models/indox.dart';
import '../../view_models/chats_vm.dart';
import '../../view_models/helpers.dart';
import '../widgets/widgets.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key, required this.conversation}) : super(key: key);
  final Conversation conversation;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool sendButton = false;
  @override
  Widget build(BuildContext context) {
    return AppViewBuilder(
        model: context.read<ChatViewModel>(),
        initState: (ChatViewModel model) {
          model.convoId = widget.conversation.id!;
          model.getChats().then((value) => model.scrollDown());
        },
        builder: (ChatViewModel vm, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFECE5DD),
            appBar: AppBar(
              backgroundColor: const Color(0XFF128C7E),
              automaticallyImplyLeading: true,
              leadingWidth: 90,
              leading: Row(
                children: const [
                  BackButton(),
                  CircleAvatar(
                    child: FlutterLogo(),
                  )
                ],
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.conversation.topic?.capitalizeFirstofEach ?? "",
                    style: const TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "tap here for group info",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: vm.scrollController,
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    itemBuilder: (context, index) {
                      var data = vm.messages[index];
                      if (data.sender == "You") {
                        return OwnMessageCard(data: data);
                      }
                      return OthersCard(data: data);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: vm.messages.length,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: const Color(0xFFECE5DD),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 4, 12, 4),
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: vm.messageController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: "Message",
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (sendButton)
                                CircleAvatar(
                                  radius: 19,
                                  backgroundColor: Colors.orangeAccent,
                                  child: IconButton(
                                    onPressed: () {
                                      vm.sendChat();
                                    },
                                    icon: const Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
