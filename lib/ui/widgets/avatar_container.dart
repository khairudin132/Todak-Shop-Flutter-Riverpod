import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'cached_container.dart';

class AvatarNetworkContainer extends StatelessWidget {
  const AvatarNetworkContainer({
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
    return CachedNetworkContainer(
      imageUrl: imageUrl,
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(100),
    );
  }
}

class AvatarMemoryContainer extends StatelessWidget {
  const AvatarMemoryContainer({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final XFile imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedMemoryContainer(
      imageUrl: imageUrl,
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(100),
    );
  }
}
