import 'package:chat_app/features/splash/presentation/splash_screen.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: const SplashScreen(),
    );
  }
}
