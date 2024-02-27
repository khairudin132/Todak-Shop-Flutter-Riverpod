import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/provider/provider.dart';
import 'package:todak_shop/ui/features/address/view/widget/widget.dart';
import 'package:todak_shop/ui/features/authentication/provider/provider.dart';
import 'package:todak_shop/ui/features/authentication/view/widget/widget.dart';
import 'package:todak_shop/ui/ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.navigator.pushNamed(SettingScreen.path),
            icon: Icon(AppIconsAdaptive.setting),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: UserAvatar(radius: 60),
          ),
          SizedBox(height: 60),
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

    final list = [
      _FirstName(firstName: user?.firstName ?? ''),
      _LastName(lastName: user?.lastName ?? ''),
      _Email(email: user?.email ?? ''),
      _Gender(gender: user?.gender ?? ''),
      const _Address(),
    ];

    return ListViewSeparatedItem(
      shrinkWrap: true,
      list: list,
      itemBuilder: (context, index) => list[index],
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Divider(),
      ),
    );
  }
}

class _FirstName extends StatelessWidget {
  const _FirstName({required this.firstName});

  final String firstName;

  @override
  Widget build(BuildContext context) {
    return _LabelSubtile(
      label: 'First Name',
      subtitle: firstName,
    );
  }
}

class _LastName extends StatelessWidget {
  const _LastName({required this.lastName});

  final String lastName;

  @override
  Widget build(BuildContext context) {
    return _LabelSubtile(
      label: 'Last Name',
      subtitle: lastName,
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return _LabelSubtile(
      label: 'Email',
      subtitle: email,
    );
  }
}

class _Gender extends StatelessWidget {
  const _Gender({required this.gender});

  final String gender;

  @override
  Widget build(BuildContext context) {
    return _LabelSubtile(
      label: 'Gender',
      subtitle: gender,
    );
  }
}

class _Address extends ConsumerWidget {
  const _Address();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var address = ref.watch(saveAddressProvider);

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

class _LabelSubtile extends StatelessWidget {
  const _LabelSubtile({
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
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
