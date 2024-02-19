import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/ui/features/authentication/provider/provider.dart';
import 'package:todak_shop/ui/ui.dart';

class UserAvatar extends ConsumerWidget {
  const UserAvatar({
    super.key,
    required this.radius,
  });

  final double radius;

  double get width => radius * 2;

  double get height => radius * 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentAuthUserProvider);

    final imageUrl = user?.image;

    return AvatarContainer(
      imageUrl: imageUrl ?? '',
      width: width,
      height: height,
    );
  }
}
