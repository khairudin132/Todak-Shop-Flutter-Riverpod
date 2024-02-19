import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/ui.dart';

class ListViewSeparatedItem<T> extends StatelessWidget {
  const ListViewSeparatedItem({
    super.key,
    required this.list,
    this.message,
    this.physics,
    this.shrinkWrap = false,
    required this.itemBuilder,
    this.separatorBuilder,
  });

  final List<T>? list;
  final String? message;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final NullableIndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;

  @override
  Widget build(BuildContext context) {
    if (list.isNullOrEmpty) {
      return Text(message ?? 'No items found');
    }

    return ListView.separated(
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder ?? (context, index) => const Divider(),
      itemCount: list!.length,
    );
  }
}

class PressabledCardTile extends StatelessWidget {
  const PressabledCardTile({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.detail,
  });

  final VoidCallback onTap;
  final String? imageUrl;
  final Widget detail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          height: 100,
          child: Row(
            children: <Widget>[
              // IMAGE
              ThumbnailContainer(
                imageUrl: imageUrl ?? '',
                width: 100,
                height: double.infinity,
              ),

              // INFO
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: detail,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
