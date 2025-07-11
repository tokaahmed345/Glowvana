
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';

class CustomRoutineCard extends StatelessWidget {
  const CustomRoutineCard({
    super.key,
    required this.label,
    required this.isChecked,
    required this.icon,
    required this.onChanged,
  });

  final String label;
  final bool isChecked;
  final IconData ?icon;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
onChanged?.call(!isChecked);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.beige,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.teracotta),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor:AppColors.teracotta,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style:AppStyle.text24.copyWith(color: AppColors.brownOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
