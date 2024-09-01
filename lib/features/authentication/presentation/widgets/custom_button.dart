import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ),
    );
  }
}
