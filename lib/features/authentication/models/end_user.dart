class EndUser {
  final String id;
  final String email;

  EndUser({
    required this.id,
    required this.email,
  });

  factory EndUser.fromJson(Map<String, dynamic> data, String docId) {
    return EndUser(
      id: docId,
      email: data['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
