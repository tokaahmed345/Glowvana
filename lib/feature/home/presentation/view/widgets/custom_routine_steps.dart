
import 'package:flutter/material.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/routine_steps.dart';

class CustomRoutineStepsList extends StatelessWidget {
  const CustomRoutineStepsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: 10,
          itemBuilder: (context, index) {
            return const RoutineSteps(
              stepNumber: '1',
              stepTitle: 'Clenńs',
              description: 'Céranser\nCrannser',
            );
          }),
    );
  }
}
