import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,  this.isEnabeled=false, required this.text,required this.onPressed, required this.color, required this.textColor,
  });
final bool isEnabeled;
final String text;
final Function() onPressed;
final Color color;
final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:isEnabeled? AppColors.primary.withOpacity(.9):color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          text,
          style:
              AppStyle.text24.copyWith(color: textColor),
        ),
      ),
    );
  }
}
