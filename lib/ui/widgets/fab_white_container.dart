import 'package:flutter/material.dart';

class FabWhiteContainer extends StatelessWidget {
  /// A white container with shadow at FAB location
  const FabWhiteContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .add(const EdgeInsets.only(top: 16)),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(
              0,
              -3,
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}
