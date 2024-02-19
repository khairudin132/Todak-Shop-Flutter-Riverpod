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
      appBar: AppBar(
        title: const Text('Cart'),
        actions: const [
          CartBadge(),
        ],
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
              label: 'Checkout',
              onPressed: () async {
                if (context.mounted) {
                  context.navigator.pushNamed(
                    CheckoutScreen.path,
                    arguments: {
                      'carts': ref.read(addProductToCartProvider),
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
    final listOfCarts = ref.watch(addProductToCartProvider);

    return ListViewSeparatedItem(
      list: listOfCarts,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var selected = false;

        final cart = listOfCarts[index];

        return CartTile(
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
        );
      },
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
