import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/provider/provider.dart';
import 'package:todak_shop/ui/features/address/view/widget/widget.dart';
import 'package:todak_shop/ui/features/main_bottom_nav/controller/controller.dart';
import 'package:todak_shop/ui/ui.dart';

import '../../provider/provider.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.carts,
  });

  static const path = '/CheckoutScreen';

  final List<Cart> carts;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(checkoutCartItemProvider.notifier).getCarts(widget.carts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageBase(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      isFloatingActionButtonExpanded: false,
      floatingActionButton: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const _TotalPrice(),
            const SizedBox(height: 20),
            ConfirmButton(
              label: 'Order',
              onPressed: () async {
                final result =
                    await ref.read(checkoutToOrderProvider.notifier).checkout();

                result.when(
                  data: (data) async {
                    await showAppAlertDialog(
                      context,
                      title: 'Order Success',
                      message: 'You can check your order history',
                    );

                    if (context.mounted) {
                      context.navigator.pushNamedAndRemoveUntil(
                          MainBottomNavScreen.path, (route) => false);
                      ref.read(bottomTabIndexProvider.notifier).state = 1;
                    }
                  },
                  error: (error) async {
                    await showAppAlertDialog(
                      context,
                      title: 'Order Failed',
                      message: error.codeMessage,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      hasBottomGap: true,
      child: ListView(
        shrinkWrap: false,
        children: [
          const _Address(),
          const _CartItemList(),
          const SizedBox(height: 100),
        ].separatorListWidget(const SizedBox(height: 16)),
      ),
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
        const Text(
          'Address',
        ),
        const SizedBox(height: 4),
        AddressTile.change(
          address: address,
          onPressed: () => context.navigator.pushNamed(AddressListScreen.path),
        ),
      ],
    );
  }
}

class _CartItemList extends ConsumerWidget {
  const _CartItemList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfCarts = ref.watch(checkoutCartItemProvider).carts;

    return ListViewSeparatedItem(
      list: listOfCarts,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final cart = listOfCarts[index];

        return CartTile.noCheckbox(cart: cart);
      },
    );
  }
}

class _TotalPrice extends ConsumerWidget {
  const _TotalPrice();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(checkoutCartItemProvider).totalPrice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total'),
        Text(
          'RM $totalPrice',
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
