import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.onPressed,
    required this.label,
  })  : isIcon = false,
        icon = null;

  const SecondaryButton.icon({
    super.key,
    this.onPressed,
    required this.label,
    required this.icon,
  }) : isIcon = true;

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;

  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    if (isIcon) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
