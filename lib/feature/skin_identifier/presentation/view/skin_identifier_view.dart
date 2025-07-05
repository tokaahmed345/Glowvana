import 'package:flutter/material.dart';
import 'package:glowvana/feature/skin_identifier/presentation/view/widgets/skin_identifier_view_body.dart';

class SkinIdentifierView extends StatelessWidget {
  const SkinIdentifierView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: SkinIdentifierViewBody(),),
    );
  }
}