import 'package:flutter/material.dart';
import 'package:todak_shop/core/core.dart';

import '../ui/features/features.dart';

class RouterEntity {
  const RouterEntity({
    required this.builder,
    required this.path,
  });

  final Widget Function(Map<String, dynamic>? arguments) builder;
  final String path;
}

final _listOfPages = [
  // Splash
  RouterEntity(
    builder: (arguments) => const SplashScreen(),
    path: SplashScreen.path,
  ),

  // OnBoarding
  RouterEntity(
    builder: (arguments) => const OnBoardingScreen(),
    path: OnBoardingScreen.path,
  ),

  // Authentication
  RouterEntity(
    builder: (arguments) => SignInScreen(),
    path: SignInScreen.path,
  ),

  // Main
  RouterEntity(
    builder: (arguments) => const MainBottomNavScreen(),
    path: MainBottomNavScreen.path,
  ),

  // Setting
  RouterEntity(
    builder: (arguments) => const SettingScreen(),
    path: SettingScreen.path,
  ),

  // Product
  RouterEntity(
    builder: (arguments) => ProductDetailScreen(
      id: arguments!['id'] as int,
    ),
    path: ProductDetailScreen.path,
  ),

  // Cart
  RouterEntity(
    builder: (arguments) => const CartDetailScreen(),
    path: CartDetailScreen.path,
  ),

  // Checkout
  RouterEntity(
    builder: (arguments) => CheckoutScreen(
      carts: arguments!['carts'] as List<Cart>,
    ),
    path: CheckoutScreen.path,
  ),

  // Address
  RouterEntity(
    builder: (arguments) => const AddressListScreen(),
    path: AddressListScreen.path,
  ),
  RouterEntity(
    builder: (arguments) => AddAddressScreen(),
    path: AddAddressScreen.path,
  ),

  // Order
  RouterEntity(
    builder: (arguments) => OrderDetailScreen(
      order: arguments!['order'] as Order,
    ),
    path: OrderDetailScreen.path,
  ),
];

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    // Find the correct page configuration based on the route name
    final page = _listOfPages.firstWhere(
      (element) => element.path == settings.name,
      orElse: () =>
          _listOfPages.first, // Fallback to the default page if not found
    );

    // Return the MaterialPageRoute with the appropriate builder
    return MaterialPageRoute(
      builder: (context) =>
          page.builder(settings.arguments as Map<String, dynamic>?),
      settings: settings,
    );
  }
}
