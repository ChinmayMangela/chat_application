import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chat_app/features/authentication/presentation/screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset(
          'assets/images/splash_animation.json',
          fit: BoxFit.cover,
        ),
      ),
      splashIconSize: 500,
      nextScreen: const LogInScreen(),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
