import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/icon_elevated_button.dart';

class StepsOfUse extends StatelessWidget {
  const StepsOfUse({
    super.key,
    required this.routineModel,
  });
  final RoutineModel routineModel;

  @override
  Widget build(BuildContext context) {
    final themeType = Theme.of(context);
    return Positioned(
      right: 0,
      left: 0,
      bottom: 10,
      child: Container(
        height: MediaQuery.of(context).size.height *.5,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: themeType.cardColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Step ${routineModel.stepOrder}: ${routineModel.title}",
                style: AppStyle.text24
                    .copyWith(color: themeType.textTheme.bodyMedium!.color)),
            Text(routineModel.description,
                style: AppStyle.text16
                    .copyWith(color: themeType.textTheme.bodySmall!.color)),
            Text("Why you need this:",
                style: AppStyle.text24
                    .copyWith(color: themeType.textTheme.bodyMedium!.color)),
            Text(routineModel.why,
                style: AppStyle.text16
                    .copyWith(color: themeType.textTheme.bodySmall!.color)),
            Text("How To Use :",
                style: AppStyle.text24
                    .copyWith(color: themeType.textTheme.bodyMedium!.color)),
            Text(
              routineModel.howTo,
              style: AppStyle.text16
                  .copyWith(color: themeType.textTheme.bodySmall!.color),
            ),
            const SizedBox(height: 10),
            IconElevatedButton(
              routineModel: routineModel,
            ),
          ],
        ),
      ),
    );
  }
}
