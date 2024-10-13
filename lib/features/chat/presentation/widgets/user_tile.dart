import 'package:chat_app/features/authentication/models/end_user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final EndUser user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.email),
    );
  }
}
