
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
class CustomTrackMasks extends StatelessWidget {
  const CustomTrackMasks({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool?> onChanged;

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
          Expanded(
            child: CheckboxListTile(
              value: isChecked,
              onChanged: onChanged,
              contentPadding: EdgeInsets.zero,
              title:  Text(
                "Used mask this week?",
                style: AppStyle.text24.copyWith(color: AppColors.brown,fontSize: 18)
              ),
              subtitle: Text(
                isChecked ? "Well done! 🌸" : "Don't forget your weekly mask! 💆‍♀️",
                style: AppStyle.text16.copyWith(color:  AppColors.brownAccent,fontWeight: FontWeight.bold,fontSize: 17)
              ),
              activeColor: AppColors.brownOrange,
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
           Image.asset(
            "assets/images/mini_mask.png",fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width*.2,
            height: MediaQuery.of(context).size.height*.1,
          ),
        ],
      ),
    );
  }
}
