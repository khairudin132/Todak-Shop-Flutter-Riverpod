import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/cart/provider/provider.dart';
import 'package:todak_shop/ui/ui.dart';

class CartBadge extends ConsumerWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRouterEntity = AppRouter.getCurrentRouterEntity(context);

    final bool isCartDetailScreen =
        currentRouterEntity?.path == CartDetailScreen.path;

    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: const badges.BadgeAnimation.slide(
          // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
          // curve: Curves.easeInCubic,
          ),
      showBadge: true,
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.red,
      ),
      badgeContent: Consumer(
        builder: (context, ref, child) {
          final total = ref.watch(totalCartQuantityProvider);

          var totalQuantity = 0;

          total.whenData(
            (value) => totalQuantity = value,
          );

          return Text(
            totalQuantity.toString(),
            style: context.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          );
        },
      ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: isCartDetailScreen
            ? () {}
            : () {
                ref
                    .read(collectCartItemForCheckoutProvider.notifier)
                    .clearCart();
                context.navigator.pushNamed(CartDetailScreen.path);
              },
      ),
    );
  }
}
