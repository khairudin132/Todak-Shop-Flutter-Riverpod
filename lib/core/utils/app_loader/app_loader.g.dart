// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_loader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppLoader)
final appLoaderProvider = AppLoaderProvider._();

final class AppLoaderProvider extends $NotifierProvider<AppLoader, bool> {
  AppLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLoaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLoaderHash();

  @$internal
  @override
  AppLoader create() => AppLoader();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$appLoaderHash() => r'c047eb4d2414f6a528e7d049b31caf359cfc2301';

abstract class _$AppLoader extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
