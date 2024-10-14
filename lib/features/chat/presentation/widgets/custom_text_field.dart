import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
