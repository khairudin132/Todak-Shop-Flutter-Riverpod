import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/main.dart';
import 'package:todak_shop/ui/ui.dart';

Future<Widget> _buildApp(Map<String, Object> prefs) async {
  SharedPreferences.setMockInitialValues(prefs);
  final sharedPrefs = await SharedPreferences.getInstance();

  return ProviderScope(
    overrides: [sharedPreferencesProvider.overrideWithValue(sharedPrefs)],
    child: const MyApp(),
  );
}

void main() {
  testWidgets('App boots into the splash screen', (tester) async {
    await tester.pumpWidget(await _buildApp({}));

    expect(find.byType(SplashScreen), findsOneWidget);
  });

  testWidgets('First-time install is routed to onboarding', (tester) async {
    await tester.pumpWidget(await _buildApp({}));
    // Let the splash post-frame redirect and route transition complete.
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(OnBoardingScreen), findsOneWidget);
  });
}
