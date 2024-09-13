import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isPasswordField,
    this.togglePasswordVisibility,
    this.obscureText = false,
    required this.autoFillHints,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final bool obscureText;
  final void Function()? togglePasswordVisibility;
  final Iterable<String> autoFillHints;

  @override
  Widget build(BuildContext context) {
    const borderColor = Colors.white;
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return TextFormField(
      autofillHints: autoFillHints,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black,
          ),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: isPasswordField
            ? IconButton(
                onPressed: togglePasswordVisibility,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
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
