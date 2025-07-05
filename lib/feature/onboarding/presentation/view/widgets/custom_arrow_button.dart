
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';

class CustomArrowButton extends StatelessWidget {
  const CustomArrowButton({
    super.key,
    required this.forward, required this.icon,
  });

  final VoidCallback forward;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.white24,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: forward, 
        icon:  Icon(

icon,          size: 35,
          color: AppColors.white
        ),
      ),
    );
  }
}
