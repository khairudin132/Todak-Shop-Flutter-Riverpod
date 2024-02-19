import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/address/view/widget/widget.dart';
import 'package:todak_shop/ui/ui.dart';

class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({
    super.key,
    required this.order,
  });

  static const path = '/OrderDetailScreen';

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = [
      _DateTime(dateTime: order.item!.createdAt!),
      _Address(address: order.item!.address!),
      _TotalPrice(price: order.item!.totalPrice!),
      for (var e in order.item!.carts!) CartTile.noCheckbox(cart: e)
    ];

    return PageBase(
      appBar: AppBar(
        title: const Text('Order Detail'),
      ),
      hasBottomGap: true,
      child: ListViewSeparatedItem(
        list: list,
        itemBuilder: (context, index) => list[index],
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Divider(),
        ),
      ),
    );
  }
}

class _DateTime extends StatelessWidget {
  const _DateTime({required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _BoughtDate(dateTime: dateTime),
        _BoughtTime(dateTime: dateTime),
      ].separatorListWidget(const SizedBox(height: 14)),
    );
  }
}

class _BoughtDate extends StatelessWidget {
  const _BoughtDate({required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return _HorizontalLabelSubtile(
      label: 'Date',
      subtitle: dateTime.date,
    );
  }
}

class _BoughtTime extends StatelessWidget {
  const _BoughtTime({required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return _HorizontalLabelSubtile(
      label: 'Time',
      subtitle: dateTime.time,
    );
  }
}

class _Address extends ConsumerWidget {
  const _Address({required this.address});

  final Address address;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: AddressTile(address: address),
        ),
      ],
    );
  }
}

class _TotalPrice extends StatelessWidget {
  const _TotalPrice({required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    return _HorizontalLabelSubtile(
      label: 'Total Price',
      subtitle: 'RM $price',
    );
  }
}

class _HorizontalLabelSubtile extends StatelessWidget {
  const _HorizontalLabelSubtile({
    required this.label,
    required this.subtitle,
  });

  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.titleMedium!.copyWith(
            fontSize: 15,
          ),
        ),
        Text(
          subtitle,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
