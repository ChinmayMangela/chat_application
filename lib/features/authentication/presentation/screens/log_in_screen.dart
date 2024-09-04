import 'package:chat_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:chat_app/features/authentication/presentation/widgets/custom_textfield.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/services/authentication/authentication_service.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool obscurePassword = true;
  final _authenticationService = AuthenticationService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _logIn() async {
    Utils.showCircularProgressIndicator(context);
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty && password.isEmpty) {
      Utils.showSnackBar('Enter your username or email Address to login');
      return;
    }

    await _authenticationService.logInWithEmail(
      email,
      password,
    );
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  void _togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

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
              Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.secondary,
                size: 150,
              ),
              const SizedBox(height: 40),
              _buildHeadingText(textTheme),
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

  Widget _buildHeadingText(TextTheme textTheme) {
    return Text(
      'Welcome back, You have been missed!!',
      style: textTheme.bodyLarge!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      hintText: 'Email',
      isPasswordField: false,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      hintText: 'Password',
      isPasswordField: true,
      obscureText: obscurePassword,
      togglePasswordVisibility: _togglePasswordVisibility,
    );
  }
}
