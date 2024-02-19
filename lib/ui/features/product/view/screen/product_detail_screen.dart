import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/cart/provider/provider.dart';
import 'package:todak_shop/ui/features/product/provider/provider.dart';
import 'package:todak_shop/ui/ui.dart';

import '../widget/widget.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.id});

  static const path = '/ProductDetailScreen';

  final int id;

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late Product productItem;

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(getProductDetailProvider(widget.id));

    return PageBase(
      appBar: AppBar(
        title: const Text('Product Detail'),
        actions: const [
          CartBadge(),
        ],
      ),
      floatingActionButton: ConfirmButton(
        label: 'Buy',
        onPressed: () async {
          await showAddCartModalBottomSheet(
            context,
            product: productItem,
            onPressed: (cartItem) async {
              await ref
                  .read(addProductToCartProvider.notifier)
                  .addCart(Cart(item: cartItem));
            },
          );
        },
      ),
      hasBottomGap: true,
      child: product.when(
        data: (product) {
          if (product == null) {
            return const NoItemsFound();
          }

          productItem = product;

          return ListView(
            shrinkWrap: false,
            children: [
              _Image(product: product),
              _ProductName(product: product),
              _Rating(product: product),
              _Description(product: product),
              // _Tabs(course: course),
            ].separatorListWidget(const SizedBox(height: 16)),
          );
        },
        error: asyncError,
        loading: () => const AppProgressIndicator(),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ThumbnailContainer(
      imageUrl: product.thumbnail ?? '',
      width: double.infinity,
      height: 200,
    );
  }
}

class _ProductName extends StatelessWidget {
  const _ProductName({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.title ?? '',
      style: context.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
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
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: context.textTheme.titleMedium,
        ),
        ExpandableText(
          text: product.description ?? '',
        ),
      ],
    );
  }
}

// class _InstructorName extends StatelessWidget {
//   const _InstructorName({required this.course});

//   final CourseItem course;

//   @override
//   Widget build(BuildContext context) {
//     return IconLabel(
//       icon: AppIconsAdaptive.profile,
//       label: course.user!.name!,
//     );
//   }
// }

// class _ClassDuration extends StatelessWidget {
//   const _ClassDuration({required this.course});

//   final CourseItem course;

//   @override
//   Widget build(BuildContext context) {
//     return IconLabel(
//       icon: AppIconsAdaptive.clock,
//       label: course.videoLength?.toString() ?? '',
//     );
//   }
// }



// class _Tabs extends StatelessWidget {
//   const _Tabs({required this.course});

//   final CourseItem course;

//   @override
//   Widget build(BuildContext context) {
//     return CustomTabBar(
//       tabs: [
//         TabViewItem(
//           label: 'Lessons',
//           view: LessonList(courseId: course.id!),
//         ),
//         TabViewItem(
//           label: 'Instructors',
//           view: Center(child: Text('Instructors')),
//         ),
//         TabViewItem(
//           label: 'Reviews',
//           view: Center(child: Text('Reviews')),
//         ),
//       ],
//     );
//   }
// }
