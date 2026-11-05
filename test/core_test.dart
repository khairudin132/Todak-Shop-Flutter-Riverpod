import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/checkout/provider/provider.dart';
import 'package:todak_shop/ui/features/order/provider/provider.dart';

/// Returns a DummyJSON-like `auth/login` payload for every POST.
class _FakeNetwork implements NetworkStorageInterface<Response> {
  @override
  bool? get isTokenExpired => false;

  @override
  Map<String, dynamic>? get getAuthorizationHeader => {};

  @override
  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async => Response(requestOptions: RequestOptions(path: path));

  @override
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async => Response(
    requestOptions: RequestOptions(path: path),
    data: {'id': 1, 'username': 'emilys', 'token': 'jwt-token'},
  );
}

Future<(ProviderContainer, SharedPreferences)> _container(
  Map<String, Object> prefs,
) async {
  SharedPreferences.setMockInitialValues(prefs);
  final sharedPrefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      networkStorageServiceProvider.overrideWithValue(
        NetworkStorageService<Response>(_FakeNetwork()),
      ),
    ],
  );
  addTearDown(container.dispose);
  return (container, sharedPrefs);
}

void main() {
  group('AuthenticationRepo', () {
    test('signIn persists token and login flag before completing', () async {
      final (container, prefs) = await _container({});

      await container
          .read(authenticationRepoProvider)
          .signIn(SignInRequest(username: 'emilys', password: 'x'));

      expect(prefs.getString(Constant.accountTokenKey), 'jwt-token');
      expect(prefs.getBool(Constant.isLoggedInKey), isTrue);
      expect(container.read(authenticationRepoProvider).user?.id, 1);
    });

    test('signOut clears the session instead of throwing', () async {
      final (container, prefs) = await _container({
        Constant.accountTokenKey: 'jwt-token',
        Constant.isLoggedInKey: true,
      });

      await container.read(authenticationRepoProvider).signOut();

      expect(prefs.getString(Constant.accountTokenKey), isNull);
      expect(prefs.getBool(Constant.isLoggedInKey), isNull);
      expect(container.read(authenticationRepoProvider).user, isNull);
    });
  });

  group('Orders', () {
    test('addOrder keeps orders already in storage', () async {
      final (container, prefs) = await _container({
        Constant.orderKey: [Order(id: 0).toJson()],
      });

      // Deliberately skip reading the list first (fresh app start).
      await container.read(orderRepoProvider).addOrder(Order());

      final stored = prefs.getStringList(Constant.orderKey)!;
      expect(stored.map((e) => Order.fromJson(e).id), [0, 1]);
    });

    test('checkout refreshes an already-read order list', () async {
      final (container, _) = await _container({
        Constant.selectedSaveAddressKey: Address(id: 0, name: 'Home').toJson(),
      });
      // Keep the auto-dispose checkout provider alive during the test.
      container.listen(checkoutToOrderProvider, (_, _) {});

      final emitted = <List<Order>>[];
      container.listen(
        orderListProvider,
        (_, next) => emitted.add(next),
        fireImmediately: true,
      );
      expect(emitted.single, isEmpty);

      final result = await container
          .read(checkoutToOrderProvider.notifier)
          .checkout();

      expect(result, isA<ApiSuccess<void>>());
      // Listeners (i.e. the Order tab) must be notified of the new order.
      expect(emitted, hasLength(2));
      expect(emitted.last, hasLength(1));
    });
  });

  group('SharedPreferences logging', () {
    test('redacts the account token', () {
      expect(
        describePrefsValue(Constant.accountTokenKey, 'jwt-token'),
        isNot(contains('jwt-token')),
      );
      expect(describePrefsValue(Constant.themeModeKey, 'dark'), 'dark');
    });
  });
}
