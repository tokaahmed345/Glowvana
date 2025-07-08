
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/cashed_image_from_hive.dart';

class RoutineSteps extends StatelessWidget {
  const RoutineSteps({
    super.key,
    required this.stepNumber,
    required this.stepTitle,
    required this.description,
    required this.image,
    required this.onTap,
  });

  final String stepNumber;
  final String stepTitle;
  final String description;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,  
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Step\n$stepNumber',
                textAlign: TextAlign.center,
                style: AppStyle.text24.copyWith(
                  color: theme.colorScheme.onPrimary,  
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stepTitle,
                    style: theme.textTheme.bodyLarge?.copyWith(
                     fontWeight: FontWeight.bold,
color: theme.colorScheme.primary
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            CachedImageFromHive(
              height: MediaQuery.of(context).size.height * .2,
              imageUrl: image,
              width: MediaQuery.of(context).size.width * .25,
            )
          ],
        ),
      ),
    );
  }
}

