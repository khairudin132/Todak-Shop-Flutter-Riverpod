import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/features/authentication/provider/provider.dart';
import 'package:todak_shop/ui/ui.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const path = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  String message = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkCurrentUser(context);
    });
  }

  Future<void> _checkCurrentUser(BuildContext context) async {
    // Fetch the current authenticated user
    await ref.read(currentAuthUserProvider.notifier).getCurrentAuthUser();

    // Check if it's the first time the user has installed the app
    final isFirstTimer =
        ref.read(appDeviceRepoProvider).getIsFirstTimeInstallApp;

    // Check if the token is expired
    final isTokenExpired = ref.read(authenticationRepoProvider).isTokenExpired;

    // Check if there is an authenticated user
    final isAuthenticatedUser = ref.read(currentAuthUserProvider) != null;

    // Handle first-time app installation
    if (isFirstTimer) {
      if (context.mounted) {
        context.navigator.pushNamedAndRemoveUntil(
          OnBoardingScreen.path,
          (_) => false,
        );
      }
      return;
    }

    // Handle token expiration
    if (isTokenExpired) {
      await ref.read(authenticationRepoProvider).signOut();
      if (context.mounted) {
        context.navigator.pushNamedAndRemoveUntil(
          SignInScreen.path,
          (_) => false,
        );
      }
      return;
    }

    // Navigate based on authentication status
    if (isAuthenticatedUser) {
      if (context.mounted) {
        context.navigator.pushNamedAndRemoveUntil(
          MainBottomNavScreen.path,
          (_) => false,
        );
      }
    } else {
      if (context.mounted) {
        context.navigator.pushNamedAndRemoveUntil(
          SignInScreen.path,
          (_) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
