import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obSecureText,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obSecureText;

  @override
  Widget build(BuildContext context) {
    const borderColor = Colors.white;
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return TextField(
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Colors.black,
      ),
      controller: controller,
      obscureText: obSecureText,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Theme.of(context).colorScheme.tertiary,
        filled: true,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
