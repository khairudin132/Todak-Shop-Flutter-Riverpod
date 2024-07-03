import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/provider/provider.dart';
import 'package:todak_shop/ui/features/address/view/widget/widget.dart';
import 'package:todak_shop/ui/features/authentication/provider/provider.dart';
import 'package:todak_shop/ui/features/authentication/view/widget/widget.dart';
import 'package:todak_shop/ui/ui.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageBase(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.navigator.pushNamed(SettingScreen.path),
            icon: Icon(AppIconsAdaptive.setting),
          ),
        ],
      ),
      floatingActionButton: ConfirmButton(
        label: 'Sign Out',
        onPressed: () async {
          final result =
              await ref.read(currentAuthUserProvider.notifier).signOut();

          result.when(
            data: (data) async {
              if (context.mounted) {
                final result =
                    await ref.read(currentAuthUserProvider.notifier).reset();
                result.when(
                  data: (data) {
                    context.navigator.pushReplacementNamed(SplashScreen.path);
                  },
                  error: (error) async {
                    if (context.mounted) {
                      await showAppAlertDialog(
                        context,
                        title: 'Error Sign Out',
                        message: error.codeMessage,
                        errors: error.errors,
                      );
                    }
                  },
                );
              }
            },
            error: (error) async {
              if (context.mounted) {
                await showAppAlertDialog(
                  context,
                  title: 'Error Sign Out',
                  message: error.codeMessage,
                  errors: error.errors,
                );
              }
            },
          );
        },
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _UserDetails(),
        ],
      ),
    );
  }
}

class _UserDetails extends ConsumerWidget {
  const _UserDetails();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentAuthUserProvider);

    if (user == null) return const SizedBox.shrink();

    String fullName = '${user.firstName} ${user.lastName}';

    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserAvatar(radius: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...[
                    LabelSubtile(
                      label: 'Name',
                      subtitle: fullName,
                    ),
                    LabelSubtile(
                      label: 'Email',
                      subtitle: user.email ?? '',
                    ),
                    // LabelSubtile(
                    //   label: 'First Name',
                    //   subtitle: user.firstName ?? '',
                    // ),
                  ].separatorListWidget(const SizedBox(height: 12)),
                  const SizedBox(height: 24),
                  SecondaryButton.icon(
                    label: 'Edit',
                    icon: AppIconsAdaptive.edit,
                    onPressed: () {},
                    // onPressed: () =>
                    //     context.navigator.pushNamed(EditProfileScreen.path),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Address extends ConsumerWidget {
  const _Address();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var address = ref.watch(defaultAddressProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: context.textTheme.titleMedium!.copyWith(
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 6),
        DefaultTextStyle(
          style: context.textTheme.bodyMedium!,
          child: AddressTile.change(
            address: address,
            onPressed: () =>
                context.navigator.pushNamed(AddressListScreen.path),
          ),
        ),
      ],
    );
  }
}
