import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/ui.dart';

class ThumbnailContainer extends StatelessWidget {
  const ThumbnailContainer({
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
      borderRadius: BorderRadius.circular(Constant.radius),
    );
  }
}
