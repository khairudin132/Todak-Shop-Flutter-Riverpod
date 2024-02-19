import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  // ------------------------------- PROPERTIES --------------------------------
  final VoidCallback onPressed;
  final String label;

  // ------------------------------- FIELDS ------------------------------------

  // ------------------------------- METHODS -----------------------------------
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
