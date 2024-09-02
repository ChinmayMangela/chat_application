import 'package:chat_app/services/authentication/authentication_service.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  final _authenticationService = AuthenticationService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Utils.showSnackBar(context, 'Please fill in all fields');
      return;
    }

    if (password != confirmPassword) {
      Utils.showSnackBar(context, 'Passwords do not match');
      return;
    }

    try {
      await _authenticationService.signUpWithEmail(
       email,
        password,
      );
    } on FirebaseAuthException catch (e) {
      if(mounted) {
        Utils.showSnackBar(
          context,
          e.message.toString(),
        );
      }
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
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
              const Icon(Icons.person, size: 150),
              const SizedBox(height: 40),
              _buildHeadingText(textTheme),
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

  Widget _buildHeadingText(TextTheme textTheme) {
    return Text(
      'Create An Account',
      style: textTheme.headlineSmall!.copyWith(
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
      obscureText: obscurePassword,
      isPasswordField: true,
      togglePasswordVisibility: _togglePasswordVisibility,
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextField(
      controller: _confirmPasswordController,
      hintText: 'Confirm Password',
      obscureText: obscureConfirmPassword,
      isPasswordField: true,
      togglePasswordVisibility: _toggleConfirmPasswordVisibility,
    );
  }
}
