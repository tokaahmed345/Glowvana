
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/bullet_point.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/icon_elevated_button.dart';

class StepsOfUse extends StatelessWidget {
  const StepsOfUse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      left: 10,
      bottom: 10,
      child: Container(
        height: MediaQuery.of(context).size.height*.5,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.brownRosy,
          borderRadius: BorderRadius.circular(24),
        
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              "Step 3: Serum",
              style:AppStyle.text24.copyWith(color:  AppColors.brownOrange,)
            ),
             Text(
              "Niacinamide 10% + Zinc",
              style: AppStyle.text16.copyWith(color: AppColors.black.withOpacity(.8),)

            ),
             Text(
              "Why you need this:",
              style: AppStyle.text24.copyWith(color: AppColors.black)
            ),
            const BulletPoint(text: "Apply 2 drops after toner"),
            const BulletPoint(text: "Gently massage into skin"),
            const BulletPoint(text: "Wait 1–2 min before next step"),
            const SizedBox(height: 10),
           const  IconElevatedButton(),
          
          ]
          ,
        ),
      ),
    );
  }
}

