import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todak_shop/core/core.dart';

class OnBoardingBase extends StatelessWidget {
  const OnBoardingBase({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // lottie
            SizedBox(
              width: double.infinity,
              height: context.mediaQuery.size.height / 3,
              child: LottieBuilder.asset(imagePath),
            ),
            const SizedBox(height: 40),

            // text
            Text(
              title,
              style: context.textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
