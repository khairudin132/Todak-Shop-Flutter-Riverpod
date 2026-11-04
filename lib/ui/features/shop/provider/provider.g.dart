// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentCategory)
final currentCategoryProvider = CurrentCategoryProvider._();

final class CurrentCategoryProvider
    extends $NotifierProvider<CurrentCategory, CategoryItem> {
  CurrentCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentCategoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentCategoryHash();

  @$internal
  @override
  CurrentCategory create() => CurrentCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryItem value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryItem>(value),
    );
  }
}

String _$currentCategoryHash() => r'6da65235715f50e55f6eac77cf5dc4a0f7443be7';

abstract class _$CurrentCategory extends $Notifier<CategoryItem> {
  CategoryItem build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CategoryItem, CategoryItem>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoryItem, CategoryItem>,
              CategoryItem,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(ListCategories)
final listCategoriesProvider = ListCategoriesProvider._();

final class ListCategoriesProvider
    extends $AsyncNotifierProvider<ListCategories, List<CategoryItem>> {
  ListCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listCategoriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listCategoriesHash();

  @$internal
  @override
  ListCategories create() => ListCategories();
}

String _$listCategoriesHash() => r'52ab56726729af13beceef27c74401be596ba380';

abstract class _$ListCategories extends $AsyncNotifier<List<CategoryItem>> {
  FutureOr<List<CategoryItem>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<CategoryItem>>, List<CategoryItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CategoryItem>>, List<CategoryItem>>,
              AsyncValue<List<CategoryItem>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
