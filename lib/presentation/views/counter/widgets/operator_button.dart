import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  const OperatorButton({required this.iconData, this.onPressed, super.key});

  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}
