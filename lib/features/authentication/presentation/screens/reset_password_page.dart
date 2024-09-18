import 'package:chat_app/features/authentication/presentation/widgets/custom_button.dart';
import 'package:chat_app/features/authentication/presentation/widgets/custom_textfield.dart';
import 'package:chat_app/services/authentication/authentication_service.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();
  final _authenticationService = AuthenticationService();
  
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();
    if(email.isEmpty) {
      Utils.showSnackBar('Enter your email');
      return;
    }
    await _authenticationService.resetPassword(email);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Reset Password'),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Please enter your email address. you will receive a link to create a new password via email'),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _emailController,
              hintText: '',
              isPasswordField: false,
              autoFillHints: const [AutofillHints.email],
            ),
            const SizedBox(height: 10),
            CustomButton(onTap: _resetPassword, label: 'Reset Password')
          ],
        ),
      ),
    );
  }
}
