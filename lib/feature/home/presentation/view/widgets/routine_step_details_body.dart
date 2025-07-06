import 'package:flutter/material.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/product_image.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/steps_of_use.dart';

class RoutineStepDetailsViewBody extends StatelessWidget {
  const RoutineStepDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          "assets/images/routine_details.jfif",
          fit: BoxFit.cover,
        )),
       const ProductImage(),
      const  StepsOfUse(),
      ],
    );
  }
}
