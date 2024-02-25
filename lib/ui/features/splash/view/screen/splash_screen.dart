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

    // schedular binding
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkCurrentUser();
    });

    // _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    final user = ref.read(currentAuthUserProvider);
    final isFirstTimer =
        ref.read(appDeviceRepoProvider).getIsFirstTimeInstallApp;
    final isLoggedIn = ref.read(authenticationRepoProvider).getIsLoggedIn;
    final isTokenExpired = ref.read(authenticationRepoProvider).isTokenExpired;

    bool isAuthenticated = user != null;

    // If the token is expired, reset authentication and navigate to sign-in screen
    if (isTokenExpired) {
      await ref.read(authenticationRepoProvider).reset();

      if (context.mounted) {
        context.navigator.pushNamedAndRemoveUntil(
          SignInScreen.path,
          (_) => false,
        );
      }
      return;
    }

    // If it's the first time the user has installed the app, show onboarding screen
    if (isFirstTimer) {
      if (context.mounted) {
        context.navigator.pushNamedAndRemoveUntil(
          OnBoardingScreen.path,
          (_) => false,
        );
      }
      return;
    }

    // If user is authenticated, navigate to main bottom navigation screen, else show sign-in screen
    if (isAuthenticated) {
      if (context.mounted) {
        context.navigator.pushNamedAndRemoveUntil(
          MainBottomNavScreen.path,
          (_) => false,
        );
      }
    } else {
      // Attempt to get the current authenticated user, or handle the sign-in flow
      await ref.read(currentAuthUserProvider.notifier).getCurrentAuthUser();
      if (context.mounted) {
        // After attempting to get the current user, check authentication status again
        final updatedUser = ref.read(currentAuthUserProvider);
        if (updatedUser != null) {
          context.navigator.pushNamedAndRemoveUntil(
            MainBottomNavScreen.path,
            (_) => false,
          );
        } else {
          context.navigator.pushNamedAndRemoveUntil(
            SignInScreen.path,
            (_) => false,
          );
        }
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
