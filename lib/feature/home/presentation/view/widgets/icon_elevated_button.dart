
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/functions/custom_launch_url.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';

class IconElevatedButton extends StatelessWidget {
  const IconElevatedButton({
    super.key, required this.routineModel,
  });
final RoutineModel routineModel;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
launchCustomUrl(context,routineModel.tutorialUrl);
      },
      icon: const Icon(Icons.play_circle_fill),
      label: const Text("Watch Tutorial"),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brownOrange,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
      ),
    );
  }
}