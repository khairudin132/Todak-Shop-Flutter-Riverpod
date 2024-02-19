import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/shop/provider/provider.dart';
import 'package:todak_shop/ui/ui.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return PageBase(
      appBar: AppBar(
        actions: const [
          CartBadge(),
        ],
      ),
      hasBodyPadding: false,
      child: RefreshIndicator.adaptive(
        onRefresh: () => Future.wait([
          ref.refresh(listCategoriesProvider.future),
          ref.refresh(getProductsNotifiedByCategoryProvider.future),
        ]),
        child: ListView(
          children: const [
            // _GreetName(),
            // const BannerPromotion(),
            _ProductCarouselCategory(),
          ],
        ),
      ),
    );
  }
}

class _ProductCarouselCategory extends StatelessWidget {
  const _ProductCarouselCategory();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _CategoryList(),
        _ProductList(),
      ],
    );
  }
}

class _CategoryList extends ConsumerWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listCategoriesProvider);

    return state.when(
      data: (response) {
        final listOfCategories = response;

        if (listOfCategories.isNullOrEmpty) {
          return const NoItemsFound();
        }

        return SizedBox(
          height: 80,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: listOfCategories.length,
            itemBuilder: (context, index) {
              final item = listOfCategories[index];
              final selected =
                  item.index == ref.watch(currentCategoryProvider).index;

              return SelectChipButton(
                label: item.label,
                selected: selected,
                onSelected: (value) {
                  ref
                      .read(currentCategoryProvider.notifier)
                      .updateCategoryIndex(item);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
          ),
        );
      },
      error: asyncError,
      loading: () {
        return const SizedBox();
      },
    );
  }
}

class _ProductList extends ConsumerWidget {
  const _ProductList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(getProductsNotifiedByCategoryProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: courses.when(
        data: (response) {
          final listOfProducts = response;

          if (listOfProducts.isNullOrEmpty) {
            return const NoItemsFound();
          }

          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _ProductCard(
                product: listOfProducts[index],
                onTap: () => context.navigator.pushNamed(
                  ProductDetailScreen.path,
                  arguments: {
                    'id': listOfProducts[index].id,
                  },
                ),
              );
            },
            itemCount: listOfProducts.length,
          );
        },
        error: asyncError,
        loading: () => Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Flexible(
              child: CachedContainer(
                imageUrl: product.thumbnail ?? '',
                width: double.infinity,
                height: double.infinity,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Constant.radius),
                  topRight: Radius.circular(Constant.radius),
                ),
              ),
            ),

            // Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall,
                  ),
                  Text(
                    'RM ${product.price.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: product.rating ?? 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.5),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: 20,
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
