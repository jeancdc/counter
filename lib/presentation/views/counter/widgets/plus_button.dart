import 'package:counter/presentation/views/counter/widgets/operator_button.dart';
import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OperatorButton(onPressed: onPressed, iconData: Icons.add);
  }
}
