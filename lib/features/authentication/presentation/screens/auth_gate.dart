import 'package:chat_app/features/authentication/presentation/screens/login_or_signup.dart';
import 'package:chat_app/features/chat/presentation/screens/users_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          return const UsersListScreen();
        } else {
          return const LoginOrSignup();
        }
      },
    );
  }
}
