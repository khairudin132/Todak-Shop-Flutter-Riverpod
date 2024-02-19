import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/ui.dart';

Future showAddCartModalBottomSheet(
  BuildContext context, {
  required Product product,
  required ValueChanged<CartItem> onPressed,
}) async {
  return await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      int quantity = 1;
      return Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .add(const EdgeInsets.symmetric(vertical: 10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top part
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Thumbnail
                      ThumbnailContainer(
                        imageUrl: product.thumbnail ?? '',
                        width: 100,
                        height: 100,
                      ),

                      const SizedBox(width: 12),

                      // Detail & Quantity
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title
                          Text(
                            product.title ?? '',
                            style: context.textTheme.titleMedium,
                          ),

                          // Quantity
                          _Quantity(
                            quantity: quantity,
                            onRemoved: (int value) => quantity = value,
                            onAdd: (int value) => quantity = value,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),

                // Bottom part
                const Divider(),
                const SizedBox(height: 6),
                ConfirmButton(
                  label: 'Add to Cart',
                  onPressed: () {
                    onPressed(
                      CartItem(
                        quantity: quantity,
                        product: product,
                      ),
                    );
                    context.navigator.pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

class _Quantity extends StatefulWidget {
  const _Quantity({
    required this.quantity,
    required this.onRemoved,
    required this.onAdd,
  });

  final int quantity;
  final ValueChanged<int> onRemoved;
  final ValueChanged<int> onAdd;

  @override
  State<_Quantity> createState() => __QuantityState();
}

class __QuantityState extends State<_Quantity> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            if (quantity > 1) {
              setState(() => quantity--);

              widget.onRemoved(quantity);
            }
          },
        ),
        Text('$quantity'),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() => quantity++);

            widget.onAdd(quantity);
          },
        ),
      ],
    );
  }
}
