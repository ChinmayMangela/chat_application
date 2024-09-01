import 'package:flutter/material.dart';
import 'dart:io';
import 'package:chat_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:chat_app/features/authentication/presentation/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {}

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
                'Create An Account',
                style: textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _buildEmailField(),
              const SizedBox(height: 12),
              _buildPasswordField(),
              const SizedBox(height: 12),
              _buildConfirmPasswordField(),
              const SizedBox(height: 18),
              CustomButton(onTap: _signUp, label: 'Sign Up'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?? ',
                    style: textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Text(
                      'Log in',
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

  Widget _buildConfirmPasswordField() {
    return CustomTextField(
      controller: _confirmPasswordController,
      hintText: 'Confirm Password',
      obSecureText: true,
    );
  }
}
