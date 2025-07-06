import 'package:flutter/material.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/routine_step_details_body.dart';

class RoutineStepDetailsView extends StatelessWidget {
  const RoutineStepDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
      ),
      child: const Scaffold(body: RoutineStepDetailsViewBody(),)));
  }
}