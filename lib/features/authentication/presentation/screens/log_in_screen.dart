import 'dart:io';
import 'package:chat_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:chat_app/features/authentication/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _logIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Platform.isIOS
                  ? const Icon(Icons.apple)
                  : const Icon(Icons.android, size: 150),
              const SizedBox(height: 40),
              Text(
                'Welcome back, You have been missed!!',
                style: textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _buildEmailField(),
              const SizedBox(height: 12),
              _buildPasswordField(),
              const SizedBox(height: 18),
              CustomButton(onTap: _logIn, label: 'Log In'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?? ',
                    style: textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Text(
                      'Register now',
                      style: textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      hintText: 'Email',
      obSecureText: false,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      hintText: 'Password',
      obSecureText: true,
    );
  }
}
