import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todak_shop/core/core.dart';

part 'provider.g.dart';

final getProductsNotifiedByCategoryProvider = FutureProvider((ref) async {
  final category = ref.watch(currentCategoryProvider);

  final rawString = category.rawString == 'All' ? null : category.rawString;

  return await ref
      .read(productRepoProvider)
      .getListOfProducts(category: rawString);
});

@Riverpod(keepAlive: true)
class CurrentCategory extends _$CurrentCategory {
  @override
  CategoryItem build() {
    return CategoryItem(index: 0, rawString: 'All');
  }

  void updateCategoryIndex(CategoryItem item) {
    state = item;
  }
}

@Riverpod(keepAlive: true)
class ListCategories extends _$ListCategories {
  @override
  Future<List<CategoryItem>> build() async {
    final list = await ref.read(productRepoProvider).getListOfCategories();
    list.insert(0, CategoryItem(index: 0, rawString: 'All'));
    return list;
  }
}
