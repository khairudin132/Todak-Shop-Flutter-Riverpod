import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/authentication/provider/provider.dart';
import 'package:todak_shop/ui/features/authentication/view/widget/widget.dart';
import 'package:todak_shop/ui/features/shop/view/screen/shop_screen.dart';
import 'package:todak_shop/ui/ui.dart';

import '../../controller/controller.dart';

class MainBottomNavScreen extends ConsumerWidget {
  const MainBottomNavScreen({super.key});

  static const path = '/MainBottomNavScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomTabIndexProvider);

    ref.listen<AsyncValue<bool>>(
      tokenExpirationStreamProvider,
      (previous, next) {
        next.when(
          data: (value) {
            // Debugging print statement
            log('Expiration listener triggered with value: $value');
            if (value) {
              showAppAlertDialog(context,
                  title: 'Session Expired',
                  message: 'Your session has expired. Please log in again.',
                  onPressed: () async {
                await ref
                    .read(currentAuthUserProvider.notifier)
                    .resetAuthUser();
                if (context.mounted) {
                  context.navigator.pushNamedAndRemoveUntil(
                    SignInScreen.path,
                    (_) => false,
                  );
                }
              });
            }
          },
          error: (error, stack) {
            // Debugging print statement
            log('Error in expiration stream: $error');
          },
          loading: () {
            // Handle the loading state if needed
          },
        );
      },
    );

    return PageBase(
      hasBodyPadding: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) =>
            ref.read(bottomTabIndexProvider.notifier).state = index,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Shop',
            icon: Icon(AppIconsAdaptive.home),
            activeIcon: Icon(AppIconsAdaptive.homeFilled),
          ),
          BottomNavigationBarItem(
            label: 'Order',
            icon: Icon(AppIconsAdaptive.order),
            activeIcon: Icon(AppIconsAdaptive.orderFilled),
          ),
          const BottomNavigationBarItem(
            label: 'Profile',
            icon: UserAvatar(
              radius: 15,
            ),
          ),
        ],
      ),
      child: _listOfScreens[currentIndex],
    );
  }
}

final _listOfScreens = [
  const ShopScreen(),
  const OrderListScreen(),
  const ProfileScreen(),
];
