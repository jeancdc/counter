import 'package:flutter/material.dart';

import 'operator_button.dart';

class MinusButton extends StatelessWidget {
  const MinusButton({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OperatorButton(onPressed: onPressed, iconData: Icons.remove);
  }
}
