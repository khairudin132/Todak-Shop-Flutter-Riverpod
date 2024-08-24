import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/cart/provider/provider.dart';
import 'package:todak_shop/ui/ui.dart';

class CartDetailScreen extends ConsumerWidget {
  const CartDetailScreen({super.key});

  static const path = '/CartDetailScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageBase(
      appBar: const ShoppyAppBarModel(
        title: 'Cart',
        requireCartBadge: true,
      ),
      isFloatingActionButtonExpanded: false,
      floatingActionButton: FabWhiteContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const _TotalPrice(),
            const SizedBox(height: 20),
            ConfirmButton(
              label: 'Checkout',
              onPressed: ref
                      .watch(collectCartItemForCheckoutProvider)
                      .isNullOrEmpty
                  ? null
                  : () async {
                      if (context.mounted) {
                        context.navigator.pushNamed(
                          CheckoutScreen.path,
                          arguments: {
                            'carts':
                                ref.read(collectCartItemForCheckoutProvider),
                          },
                        );
                      }
                    },
            ),
          ],
        ),
      ),
      hasBottomGap: true,
      child: ListView(
        shrinkWrap: false,
        children: [
          const _CartItemList(),
          const SizedBox(height: 100),
        ].separatorListWidget(const SizedBox(height: 16)),
      ),
    );
  }
}

class _CartItemList extends ConsumerWidget {
  const _CartItemList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfCarts = ref.watch(cartItemsListProvider);

    return listOfCarts.when(
      data: (list) {
        return ListViewSeparatedItem(
          list: list,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var selected = false;

            final cart = list[index];

            return Dismissible(
              key: Key(cart.id!),
              background: Container(color: context.theme.highlightColor),
              onDismissed: (direction) {
                ref
                    .read(cartItemsListProvider.notifier)
                    .removeCartItem(cart.id!);
              },
              child: CartTile(
                cart: cart,
                value: selected,
                onChanged: (value) {
                  selected = value;
                  if (value == true) {
                    ref
                        .read(collectCartItemForCheckoutProvider.notifier)
                        .addCartItem(cart);
                  } else if (value == false) {
                    ref
                        .read(collectCartItemForCheckoutProvider.notifier)
                        .deleteCartItem(cart);
                  }
                },
              ),
            );
          },
        );
      },
      error: asyncError,
      loading: () => const AppProgressIndicator(),
    );
  }
}

class _TotalPrice extends ConsumerWidget {
  const _TotalPrice();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(totalPriceCartProvider);

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
