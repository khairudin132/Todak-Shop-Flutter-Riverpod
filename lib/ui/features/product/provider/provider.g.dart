// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentCategoryHash() => r'6da65235715f50e55f6eac77cf5dc4a0f7443be7';

/// See also [CurrentCategory].
@ProviderFor(CurrentCategory)
final currentCategoryProvider =
    NotifierProvider<CurrentCategory, CategoryItem>.internal(
  CurrentCategory.new,
  name: r'currentCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentCategory = Notifier<CategoryItem>;
String _$listCategoriesHash() => r'52ab56726729af13beceef27c74401be596ba380';

/// See also [ListCategories].
@ProviderFor(ListCategories)
final listCategoriesProvider =
    AsyncNotifierProvider<ListCategories, List<CategoryItem>>.internal(
  ListCategories.new,
  name: r'listCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListCategories = AsyncNotifier<List<CategoryItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
