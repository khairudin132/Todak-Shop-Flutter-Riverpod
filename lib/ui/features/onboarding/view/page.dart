import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todak_shop/core/core.dart';
import 'package:todak_shop/core/gen/assets.gen.dart';
import 'package:todak_shop/ui/features/onboarding/view/widgets/onboarding_base.dart';
import 'package:todak_shop/ui/ui.dart';

import '../controller/controller.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  static String path = '/OnBoardingScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageBase(
      floatingActionButton: ref.watch(onBoardingIndexProvider) == 2
          ? ConfirmButton(
              label: 'Get Started',
              onPressed: () async {
                context.navigator.pushNamedAndRemoveUntil(
                  SignInScreen.path,
                  (_) => false,
                );

                await ref
                    .read(appDeviceRepoProvider)
                    .setIsFirstTimeInstallApp(false);
              },
            )
          : null,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (value) =>
                ref.read(onBoardingIndexProvider.notifier).state = value,
            children: [
              OnBoardingBase(
                imagePath: Assets.lottie.animationManLaptop,
                title: 'Online Shopping',
                subtitle:
                    'Forget about going to physical store, just get online.',
              ),
              OnBoardingBase(
                imagePath: Assets.lottie.animationOnlineTransaction,
                title: 'Pay Online',
                subtitle:
                    'With any of our online payment methods, you can pay online.',
              ),
              OnBoardingBase(
                imagePath: Assets.lottie.animationCod,
                title: 'Cash On Delivery',
                subtitle:
                    'We will deliver your product at your doorsteps with cash on delivery.',
              ),
            ],
          ),
          if (ref.watch(onBoardingIndexProvider) != 2)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: DotsIndicator(
                  dotsCount: 3,
                  position: ref.watch(onBoardingIndexProvider),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(24.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
