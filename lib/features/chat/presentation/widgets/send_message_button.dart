
import 'package:flutter/material.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key, required this.onTap});

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        child: const Icon(Icons.send),
      ),
    );
  }
}
