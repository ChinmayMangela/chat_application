import 'package:chat_app/features/authentication/presentation/screens/log_in_screen.dart';
import 'package:chat_app/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  bool showLoginScreen = true;

  void _toggleScreens() {
      setState(() {
        showLoginScreen = !showLoginScreen;
      });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginScreen
        ? LogInScreen(onTap: _toggleScreens)
        : SignUpScreen(onTap: _toggleScreens);
  }
}
