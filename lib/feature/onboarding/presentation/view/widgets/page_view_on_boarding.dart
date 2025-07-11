import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/assets/app_assets.dart';
import 'package:glowvana/core/utils/app_screens/app_screens.dart';
import 'package:glowvana/feature/onboarding/presentation/view/widgets/custom_page_view_ite.dart';
import 'package:go_router/go_router.dart';

class OnBoardingPageViewBody extends StatefulWidget {
  const OnBoardingPageViewBody({super.key});

  @override
  _OnBoardingPageViewBodyState createState() => _OnBoardingPageViewBodyState();
}

class _OnBoardingPageViewBodyState extends State<OnBoardingPageViewBody> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return
       PageView(
        controller: _pageController,
        children: [
          CustomPageViewItem(
            title: "Test Your Skin Type",
            description: "You can use the scanner to detect your skin type.",
            image: AppAssets.onboardingFaceDetect, 
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onBack: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          CustomPageViewItem(
            title: "Glow Naturally",
            description:
                "Start fresh with natural skincare made for your skin type.",
            image: AppAssets.onboardingFresh,
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onBack: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          CustomPageViewItem(
            title: "Start Your Routine",
            description: "Begin your skincare routine based on your skin type.",
            image: AppAssets.onboardingImage,
            onNext: () {
              GoRouter.of(context).push(AppScreens.skinIdentifier);
            },
            onBack: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      );
    
  }
}
