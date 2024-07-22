import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';

class LabelDetail extends StatelessWidget {
  const LabelDetail({
    super.key,
    required this.label,
    required this.subtitle,
  });

  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: context.textTheme.titleMedium!.copyWith(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
