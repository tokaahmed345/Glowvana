import 'package:flutter/material.dart';
import 'package:glowvana/feature/Auth/presentation/view/widgets/log_in_body_view.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child:  Scaffold(body: LogInBodyView(),));
  }
}