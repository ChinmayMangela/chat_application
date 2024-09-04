import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(String? message) {
    if(message == null) return;

    final snackBar = SnackBar(content: Text(message));

    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  }

  static void showCircularProgressIndicator(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
