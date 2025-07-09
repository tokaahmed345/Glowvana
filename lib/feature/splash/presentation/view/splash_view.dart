import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_screens/app_screens.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1),(){
GoRouter.of(context).push(AppScreens.onBoarding);
    }
    )
    ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/pic1.jpg",fit: BoxFit.cover,);
  }
}