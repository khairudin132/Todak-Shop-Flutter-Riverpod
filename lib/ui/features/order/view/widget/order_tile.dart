import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/ui.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.order,
    required this.onPressed,
  });

  final Order order;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Item
            _Item(
              order: order,
              onPressed: onPressed,
            ),

            const Divider(),

            // Basic Info
            _BasicInfo(order: order),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.order,
    required this.onPressed,
  });

  final Order order;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Items (${order.item!.carts!.length})'),
            AppTextButton(
              onPressed: onPressed,
              label: 'See Details',
            ),
          ],
        ),
        const SizedBox(height: 10),
        _ItemList(items: order.item!.carts!),
      ],
    );
  }
}

class _ItemList extends StatelessWidget {
  const _ItemList({required this.items});

  final List<Cart> items;

  @override
  Widget build(BuildContext context) {
    int showItemLength = items.take(4).length;

    int remainingItemLength = items.length - showItemLength;

    return SizedBox(
      height: 140,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: showItemLength,
        itemBuilder: (context, index) {
          final product = items[index].item!.product!;

          if (index == 4 && remainingItemLength > 0) {
            return _ItemThumbnail(
              product: product,
              remainingCourses: remainingItemLength,
            );
          }

          return _ItemThumbnail(product: product);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}

class _ItemThumbnail extends StatelessWidget {
  const _ItemThumbnail({
    required this.product,
    this.remainingCourses,
  });

  final Product product;
  final int? remainingCourses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Image
              ThumbnailContainer(
                imageUrl: product.thumbnail ?? '',
                width: 100,
                height: 100,
              ),

              // Blur effect
              if (remainingCourses != null)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Constant.radius),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Texts
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (remainingCourses == null)
                Text(
                  product.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              if (remainingCourses != null)
                Text(
                  '+ $remainingCourses more',
                  style: context.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BasicInfo extends StatelessWidget {
  const _BasicInfo({required this.order});

  final Order order;

  int get price => order.item!.totalPrice!;

  DateTime get dateTime => order.item!.createdAt!;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _TotalPrice(price: price),
        _BoughtDate(dateTime: dateTime),
      ],
    );
  }
}

class _TotalPrice extends StatelessWidget {
  const _TotalPrice({required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    return _LabelSubtile(
      label: 'Total Price',
      subtitle: 'RM $price',
    );
  }
}

class _BoughtDate extends StatelessWidget {
  const _BoughtDate({required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return _LabelSubtile(
      crossAxisAlignment: CrossAxisAlignment.end,
      label: 'Date',
      subtitle: dateTime.date,
    );
  }
}

class _LabelSubtile extends StatelessWidget {
  const _LabelSubtile({
    required this.label,
    required this.subtitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String label;
  final String subtitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall,
        ),
        Text(
          subtitle,
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
