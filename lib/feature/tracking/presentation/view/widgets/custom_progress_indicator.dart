import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double progress;
  final int completed;
  final int total;

  const CustomProgressIndicator({
    super.key,
    required this.progress,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.brown),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progress.clamp(0.0, 1.0),
                  strokeWidth: 14,
                  backgroundColor: AppColors.brownRosy,
                  valueColor: AlwaysStoppedAnimation(Theme.of(context)
                      .progressIndicatorTheme
                      .circularTrackColor),
                ),
              ),
              Text(
                "${(progress * 100).round()}%",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 30),
              ),
            ],
          ),
          const SizedBox(width: 30),
          Text(
            "$completed of $total steps\ncompleted",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 27),
          ),
        ],
      ),
    );
  }
}
