import 'package:chat_app/features/authentication/models/end_user.dart';
import 'package:chat_app/features/chat/models/message.dart';
import 'package:chat_app/features/chat/presentation/widgets/chats_list.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_text_field.dart';
import 'package:chat_app/features/chat/presentation/widgets/send_message_button.dart';
import 'package:chat_app/services/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});

  final EndUser user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final _chatService = ChatService();

  Future<void> _sendMessage() async {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      await _chatService.senMessage(
          receiverId: widget.user.id, message: _messageController.text);
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(widget.user.email),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          _buildChats(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                    child: CustomTextField(controller: _messageController)),
                const SizedBox(width: 10),
                SendMessageButton(onTap: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChats() {
    return StreamBuilder<List<Message>>(
      stream: _chatService.fetchMessages(
          FirebaseAuth.instance.currentUser!.uid, widget.user.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildCircularProgressIndicator();
        }

        if (snapshot.data!.isEmpty || snapshot.data == null) {
          return _showMessage('You haven\'t started conversation yet');
        }
        if (snapshot.hasData) {
          final messages = snapshot.data;
          return ChatsList(messages: messages!);
        } else {
          return _showMessage(snapshot.error.toString());
        }
      },
    );
  }

  Widget _buildCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _showMessage(String message) {
    return Center(
      child: Text(message),
    );
  }
}
