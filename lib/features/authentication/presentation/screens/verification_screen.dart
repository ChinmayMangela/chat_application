import 'dart:async';
import 'package:chat_app/features/chat/presentation/screens/users_list_screen.dart';
import 'package:chat_app/services/authentication/authentication_service.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _authenticationService = AuthenticationService();
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      _authenticationService.sendVerificationEmail();

      Timer.periodic(const Duration(seconds: 3), (_) {
        return checkEmailVerified();
      });
    }
  }

  void checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      timer!.cancel();
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const UsersListScreen()
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'A verification email has been sent to your account',
                  ),
                  const SizedBox(height: 20),
                  _buildResendButton(),
                  const SizedBox(height: 10),
                  _buildCancelButton(),
                ],
              ),
            ),
          );
  }

  Widget _buildResendButton() {
    return _buildButton(
        onTap: () {
          _authenticationService.sendVerificationEmail();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 10),
            Text(
              'Resend Email',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ));
  }

  Widget _buildCancelButton() {
    return _buildButton(
      onTap: () async {
        await _authenticationService.signOut();
      },
      child: Center(
        child: Text(
          'Cancel',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _buildButton({required Widget child, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        width: Utils.getScreenWidth(context) * 0.9,
        height: Utils.getScreenHeight(context) * 0.06,
        child: child,
      ),
    );
  }
}
