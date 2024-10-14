class Message {
  final String receiverId;
  final String senderId;
  final String message;
  final DateTime timeStamp;

  const Message({
    required this.receiverId,
    required this.senderId,
    required this.message,
    required this.timeStamp,
  });

  factory Message.fromJson(Map<String, dynamic> data) {
    return Message(
      receiverId: data['receiverId'],
      senderId: data['senderId'],
      message: data['message'],
      timeStamp: DateTime.parse(data['timeStamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receiverId': receiverId,
      'senderId': senderId,
      'message': message,
      'timeStamp': timeStamp.toIso8601String(),
    };
  }
}
