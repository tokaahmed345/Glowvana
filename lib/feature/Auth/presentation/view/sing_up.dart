import 'package:flutter/material.dart';
import 'package:glowvana/feature/Auth/presentation/view/widgets/sign_up_body_view.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child:  Scaffold(body: SignUpBodyView(),));
  }
}