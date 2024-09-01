import 'package:chat_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:chat_app/features/authentication/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/splash_animation.json'),
            const SizedBox(height: 40),
            Text(
              'Welcome back, You have been missed!!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 30),
            _buildEmailField(),
            const SizedBox(height: 12),
            _buildPasswordField(),
            const SizedBox(height: 18),
            CustomButton(onTap: _logIn, label: 'Log In'),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      hintText: 'Enter Email',
      obSecureText: false,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      hintText: 'Enter Password',
      obSecureText: true,
    );
  }
}
