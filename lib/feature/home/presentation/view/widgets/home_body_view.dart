import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/core/utils/widgets/custom_elevated_button.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/custom_routine_steps.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/download (3).jfif",
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi,Toka👋\nYour Skincare\nRoutine",
                      style: AppStyle.text24
                          .copyWith(color: AppColors.brown, fontSize: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: CustomElevatedButton(
                                text: "Morning Routine",
                                onPressed: () {},
                                color: AppColors.brown,
                                textColor: AppColors.white)),
                        Expanded(
                            child: CustomElevatedButton(
                                text: "Night Routine",
                                onPressed: () {},
                                color: AppColors.white70,
                                textColor: AppColors.salmon)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const CustomRoutineStepsList()
            ]),
          ),
        )
      ],
    );
  }
}
