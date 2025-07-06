import 'package:flutter/material.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/home_body_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: HomeBodyView(),));
  }
}