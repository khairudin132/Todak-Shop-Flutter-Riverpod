import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todak_shop/core/utils/image_picker.dart';
import 'package:todak_shop/ui/features/authentication/provider/provider.dart';
import 'package:todak_shop/ui/ui.dart';

class UserAvatar extends ConsumerStatefulWidget {
  const UserAvatar({
    super.key,
    required this.radius,
  })  : isPickImage = false,
        onChanged = null;

  const UserAvatar.pickImage({
    super.key,
    required this.radius,
    required this.onChanged,
  }) : isPickImage = true;

  final double radius;
  final ValueChanged<XFile?>? onChanged;

  final bool isPickImage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserAvatarState();
}

class _UserAvatarState extends ConsumerState<UserAvatar> {
  double get width => widget.radius * 2;

  double get height => widget.radius * 2;

  XFile? image;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentAuthUserProvider);

    final imageUrl = user?.profilePicture;

    if (widget.isPickImage) {
      return SizedBox(
        width: width * 1.2,
        height: height * 1.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (image != null)
              AvatarMemoryContainer(
                imageUrl: image!,
                width: width,
                height: height,
              )
            else
              AvatarNetworkContainer(
                imageUrl: imageUrl ??
                    'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png',
                width: width,
                height: height,
              ),
            Positioned(
              right: -10,
              bottom: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () async {
                  image = await pickImage();
                  if (image != null) {
                    setState(() {});
                    widget.onChanged!(image);
                  }
                },
                child: const Icon(Icons.camera_alt),
              ),
            ),
          ],
        ),
      );
    }

    return AvatarNetworkContainer(
      imageUrl: imageUrl ??
          'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png',
      width: width,
      height: height,
    );
  }
}
