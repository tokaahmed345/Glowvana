
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("• ", style: AppStyle.text24.copyWith(fontSize: 16,color:  AppColors.black)),
        Expanded(
          child: Text(
            text,
            style: AppStyle.text16.copyWith(fontSize: 16,color:  AppColors.black),
          ),
        ),
      ],
    );
  }
}
