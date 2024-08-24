import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';

import 'package:todak_shop/ui/features/order/provider/provider.dart';
import 'package:todak_shop/ui/ui.dart';

import '../widget/widget.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      appBar: ShoppyAppBarModel(
        title: 'Orders',
        requireCartBadge: true,
      ),
      hasBottomGap: true,
      child: _OrderItemList(),
    );
  }
}

class _OrderItemList extends ConsumerWidget {
  const _OrderItemList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listOfOrders = ref.watch(orderItemsListProvider);

    return listOfOrders.when(
      data: (data) => ListViewSeparatedItem(
        list: data,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final order = data[index];
          return OrderTile(
            order: order,
            onPressed: () => context.navigator.pushNamed(
              OrderDetailScreen.path,
              arguments: {'order': order},
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
      error: asyncError,
      loading: () => const AppProgressIndicator(),
    );
  }
}
