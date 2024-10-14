import 'package:chat_app/features/chat/models/message.dart';
import 'package:chat_app/features/chat/presentation/widgets/chat_card.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({
    super.key,
    required this.messages,
  });

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final currentMessage = messages[index];
        return ChatCard(message: currentMessage);
      },
      itemCount: messages.length,
    );
  }
}
