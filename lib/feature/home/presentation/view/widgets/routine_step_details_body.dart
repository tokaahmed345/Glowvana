import 'package:flutter/material.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/product_image.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/steps_of_use.dart';

class RoutineStepDetailsViewBody extends StatelessWidget {
  const RoutineStepDetailsViewBody({super.key, required this.routineModel});
  final RoutineModel routineModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        ProductImage(routineModel: routineModel),
        StepsOfUse(routineModel: routineModel,),
      ],
    );
  }
}
