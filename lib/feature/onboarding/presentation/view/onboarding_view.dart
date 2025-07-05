import 'package:flutter/material.dart';
import 'package:glowvana/feature/onboarding/presentation/view/widgets/page_view_on_boarding.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(body: OnBoardingPageViewBody(),);
  }
}