import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';

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
        border: Border.all(color: AppColors.teracotta),
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
                  strokeWidth: 10,
                  backgroundColor:AppColors.brownRosy,
                  valueColor:
                      const AlwaysStoppedAnimation(AppColors.teracotta),
                ),
              ),
              Text(
                "${(progress * 100).round()}%",
                style: AppStyle.text16.copyWith(
                  color: AppColors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Text(
            "$completed of $total steps\ncompleted",
            style: AppStyle.text16.copyWith(
              color: AppColors.brown,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
