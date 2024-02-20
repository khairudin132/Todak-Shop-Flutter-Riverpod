import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/provider/provider.dart';
import 'package:todak_shop/ui/features/address/view/widget/widget.dart';
import 'package:todak_shop/ui/ui.dart';

class AddressListScreen extends ConsumerWidget {
  const AddressListScreen({super.key});

  static const path = '/AddressListScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAddress = ref.watch(currentSelectAddressProvider);

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
                    await ref.read(saveAddressProvider.notifier).saveAddress();

                    if (context.mounted) {
                      context.navigator.pop();
                    }
                  },
          ),
        ],
      ),
      hasBottomGap: true,
      child: ListView(
        shrinkWrap: false,
        children: [
          const _AddressItemList(),
        ].separatorListWidget(const SizedBox(height: 16)),
      ),
    );
  }
}

class _AddressItemList extends ConsumerStatefulWidget {
  const _AddressItemList();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __AddressItemListState();
}

class __AddressItemListState extends ConsumerState<_AddressItemList> {
  @override
  Widget build(BuildContext context) {
    final listOfAddresses = ref.watch(addressListProvider);

    return ListViewSeparatedItem(
      list: listOfAddresses,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final address = listOfAddresses[index];

        final selected =
            address.id == ref.watch(currentSelectAddressProvider)?.id;

        return AddressTile.select(
          address: address,
          value: selected,
          onChanged: (value) {
            ref
                .read(currentSelectAddressProvider.notifier)
                .updateSelectAddress(address);
          },
        );
      },
    );
  }
}
