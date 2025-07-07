
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/icon_elevated_button.dart';

class StepsOfUse extends StatelessWidget {
  const StepsOfUse({
    super.key, required this.routineModel,
  });
  final RoutineModel routineModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 3,
      left: 3,
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
              "Step ${routineModel.stepOrder}: ${routineModel.title}",
              style:AppStyle.text24.copyWith(color:  AppColors.brownOrange,)
            ),
             Text(
              routineModel.description,
              style: AppStyle.text16.copyWith(color: AppColors.black.withOpacity(.8),)

            ),
             Text(
              "Why you need this:",
              style: AppStyle.text24.copyWith(color: AppColors.black)
            ),
              Text(
              routineModel.why,
        style: AppStyle.text16.copyWith(fontSize: 16,color:  AppColors.black)
            ),
               Text(
              "How To Use :",
              style: AppStyle.text24.copyWith(color: AppColors.black)
            ),
             Text(routineModel.howTo,style: AppStyle.text16.copyWith(fontSize: 16,color:  AppColors.black),
),
           
            const SizedBox(height: 10),
             IconElevatedButton(routineModel: routineModel
             ,),
          
          ]
          ,
        ),
      ),
    );
  }
}

