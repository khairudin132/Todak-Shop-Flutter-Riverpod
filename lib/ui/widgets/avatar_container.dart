import 'package:flutter/material.dart';

import 'cached_container.dart';

class AvatarContainer extends StatelessWidget {
  const AvatarContainer({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedContainer(
      imageUrl: imageUrl,
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(100),
    );
  }
}
