import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/ui.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.cart,
    required this.value,
    required this.onChanged,
  }) : isCheckbox = true;

  const CartTile.noCheckbox({
    super.key,
    required this.cart,
  })  : isCheckbox = false,
        value = null,
        onChanged = null;

  final Cart cart;
  final bool? value;
  final ValueChanged<bool>? onChanged;

  final bool isCheckbox;

  @override
  Widget build(BuildContext context) {
    final item = cart.item;
    final product = item?.product;

    return Row(
      children: [
        // Checkbox
        if (isCheckbox)
          AppCheckbox(
            value: value!,
            onChanged: onChanged!,
          ),

        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              ThumbnailContainer(
                imageUrl: product?.thumbnail ?? '',
                width: 100,
                height: 100,
              ),

              const SizedBox(width: 8),

              // Detail
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product!.title!,
                      style: context.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Qty: ${item!.quantity.toString()}',
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Price
              Text(
                'RM ${product.price.toString()}',
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
