import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/provider/provider.dart';
import 'package:todak_shop/ui/features/address/view/widget/widget.dart';
import 'package:todak_shop/ui/ui.dart';

class AddressListScreen extends ConsumerStatefulWidget {
  const AddressListScreen({super.key});

  static const path = '/AddressListScreen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddressListScreenState();
}

class _AddressListScreenState extends ConsumerState<AddressListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(defaultAddressProvider.notifier).getDefaultAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedAddress = ref.watch(defaultAddressProvider);

    return PageBase(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SecondaryButton(
            label: 'Add Address',
            onPressed: () => context.navigator.pushNamed(AddAddressScreen.path),
          ),
          const SizedBox(height: 20),
          ConfirmButton(
            label: 'Save Address',
            onPressed: selectedAddress == null
                ? null
                : () async {
                    await ref
                        .read(defaultAddressProvider.notifier)
                        .setDefaultAddress(selectedAddress.id!);

                    if (context.mounted) {
                      context.navigator.pop();
                    }
                  },
          ),
        ],
      ),
      hasBottomGap: true,
      child: const _AddressList(),
    );
  }
}

class _AddressList extends ConsumerWidget {
  const _AddressList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfAddresses = ref.watch(addressListProvider);

    return listOfAddresses.when(
      data: (list) {
        return ListViewSeparatedItem(
          list: list,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final address = list[index];

            final selected =
                address.id == ref.watch(defaultAddressProvider)?.id;

            return AddressTile.select(
              address: address,
              value: selected,
              onChanged: (value) {
                ref
                    .read(defaultAddressProvider.notifier)
                    .updateSelectAddress(address);
              },
            );
          },
        );
      },
      error: asyncError,
      loading: () => const AppProgressIndicator(),
    );
  }
}
