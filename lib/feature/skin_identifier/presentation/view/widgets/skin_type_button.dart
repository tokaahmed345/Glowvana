
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';

class SkinTypeButton extends StatelessWidget {
  final String label;
  final Color color;
  final void Function()? onTap;
  final bool isSelected;
  const SkinTypeButton({
    super.key,
    required this.label,
    required this.color,
    this.onTap,
    this.isSelected=false,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected?color:AppColors.white60, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          label,
          style: AppStyle.text16.copyWith(color: AppColors.black),
        ),
      ),
    );
  }
}
