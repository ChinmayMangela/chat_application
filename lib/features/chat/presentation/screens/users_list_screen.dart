import 'package:chat_app/features/authentication/presentation/widgets/drawer/my_drawer.dart';
import 'package:flutter/material.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('H O M E'),
      ),
    );
  }
}
