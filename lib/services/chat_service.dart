import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../features/chat/models/message.dart';

class ChatService {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> senMessage(String receiverId, String message) async {
    //get current user info
    final currentUser = _firebaseAuth.currentUser;
    final currentUserId = currentUser!.uid;
    final DateTime timeStamp = DateTime.now();

    // create new Message
    final newMessage = Message(
      receiverId: receiverId,
      senderId: currentUserId,
      message: message,
      timeStamp: timeStamp,
    );

    // create chat room id by combining both (receiver, sender) ids
    final List<String> ids = [currentUserId, receiverId];

    // create chat room id by combining both of them via underscore
    final chatRoomId = ids.join('_');

    // create chat room collection inside firebase and also add messages
    await _firebaseFireStore
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(
          newMessage.toJson(),
        );
  }

  Stream<List<Message>> fetchMessages(
      String currentUserId, String otherUserId) {
    final List<String> ids = [currentUserId, otherUserId];
    final chatRoomId = ids.join('_');
    return _firebaseFireStore
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((message) {
        return Message.fromJson(message.data());
      }).toList();
    });
  }
}
