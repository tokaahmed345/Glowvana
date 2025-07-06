
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';

class IconElevatedButton extends StatelessWidget {
  const IconElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
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