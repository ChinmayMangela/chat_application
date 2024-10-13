import 'package:chat_app/features/chat/presentation/widgets/users_list.dart';
import 'package:chat_app/features/drawer/drawer/my_drawer.dart';
import 'package:chat_app/services/users_service.dart';
import 'package:flutter/material.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final _userService = UsersService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: _userService.fetchUsers(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());

          default:
            if (snapshot.hasData && snapshot.data != null) {
              final users = snapshot.data;
              return UsersList(users: users!);
            } else {
              return const Center(
                child: Text('There are no users in this app'),
              );
            }
        }
      },
    );
  }
}
