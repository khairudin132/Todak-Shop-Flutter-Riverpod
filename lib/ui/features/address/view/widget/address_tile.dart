import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    super.key,
    required this.address,
  })  : _isChange = false,
        value = null,
        onChanged = null,
        onPressed = null;

  const AddressTile.change({
    super.key,
    required this.address,
    required this.onPressed,
  })  : _isChange = true,
        value = null,
        onChanged = null;

  const AddressTile.select({
    super.key,
    required this.address,
    required this.value,
    required this.onChanged,
  })  : _isChange = false,
        onPressed = null;

  final Address? address;
  final VoidCallback? onPressed;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  final bool _isChange;

  String? get address1 => address?.address1;

  String? get address2 => address?.address2;

  String? get city => address?.city;

  String? get state => address?.state;

  String? get postcode => address?.postcode.toString();

  String? get country => address?.country;

  String get combineAddress {
    if (address == null) {
      return 'No address selected';
    }

    final parts = [
      address1,
      address2,
      city,
      state,
      postcode,
      country,
    ];

    // Remove null and empty strings from the list
    final nonEmptyParts =
        parts.where((part) => part?.isNotEmpty ?? false).cast<String>();

    // Join the parts with a comma and space
    return nonEmptyParts.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(combineAddress)),
        const SizedBox(width: 10),
        if (_isChange == true || onChanged != null) ...[
          if (_isChange)
            TextButton(
              onPressed: onPressed,
              child: const Text('Change'),
            )
          else
            Checkbox.adaptive(
              value: value,
              onChanged: onChanged!,
            ),
        ],
      ],
    );
  }
}
