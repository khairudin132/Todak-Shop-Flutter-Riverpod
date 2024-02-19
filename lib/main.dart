import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/ui/ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeAnimationCurve: Curves.fastOutSlowIn,
        themeAnimationDuration: const Duration(milliseconds: 300),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ref.watch(themeModeSettingProvider),
        // onGenerateRoute: AppRouter.generateRoute,
        home: const GlobalLoadingIndicator(
          child: Navigator(
            onGenerateRoute: AppRouter.generateRoute,
          ),
        ),
      ),
    );
  }
}
