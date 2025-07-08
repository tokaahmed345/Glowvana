import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/core/utils/storage/hive_helper.dart';
import 'package:glowvana/core/utils/styles/app_style.dart';
import 'package:glowvana/core/utils/theme/app_theme.dart';
import 'package:glowvana/core/utils/theme/theme_cubit/theme_cubit.dart';
import 'package:glowvana/core/utils/widgets/custom_elevated_button.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/custom_routine_steps.dart';
import 'package:glowvana/feature/home/presentation/view_model/cubit/routine_steps_cubit.dart';
class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key, this.routineModel});
  final RoutineModel? routineModel;
  @override
  Widget build(BuildContext context) {
    UserSettingsStorage userSettingsStorage = getIt.get<UserSettingsStorage>();
    final skinType = userSettingsStorage.getSkinType();
    final user = getIt.get<FirebaseAuth>().currentUser;
    final userName = user?.displayName?.split(' ').first ?? "Beautiful";
    final themeCubit = context.read<ThemeCubit>();
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, themeState) {
        final isNight = themeState == AppTheme.nightTheme;
        final backgroundImage = isNight
            ? "assets/images/night_home_background.png"
            : "assets/images/download (3).jfif";

        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child:
                            BlocBuilder<RoutineStepsCubit, RoutineStepsState>(
                          builder: (context, state) {
                            final cubit = context.read<RoutineStepsCubit>();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi,$userName👋\nYour Skincare\nRoutine",
                                  style: AppStyle.text24.copyWith(
                                      color:
                                          themeState.textTheme.bodyLarge!.color,
                                      fontSize: 40),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: CustomElevatedButton(
                                            text: "Morning Routine",
                                            onPressed: () {
                                              cubit.getRoutineSteps(
                                                  skinType, 'morning');
                                              themeCubit.switchToMorning();
                                            },
                                            color: cubit.currentRoutine ==
                                                    'morning'
                                                ? AppColors.brown
                                                : AppColors.white70,
                                            textColor: cubit.currentRoutine ==
                                                    'morning'
                                                ? AppColors.white
                                                : AppColors.teracotta)),
                                    Expanded(
                                        child: CustomElevatedButton(
                                            text: "Night Routine",
                                            onPressed: () {
                                              context
                                                  .read<RoutineStepsCubit>()
                                                  .getRoutineSteps(
                                                      skinType, 'night');
                                              themeCubit.switchToNight();
                                            },
                                            color:
                                                cubit.currentRoutine == 'night'
                                                    ? AppColors.softPurple
                                                    : AppColors.white70,
                                            textColor:
                                                cubit.currentRoutine == 'night'
                                                    ? AppColors.white
                                                    : AppColors.salmon)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const CustomRoutineStepsList()
                    ]),
              ),
            )
          ],
        );
      },
    );
  }
}
