import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/helpers/user_setting_storage/hive_helper.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/bottom_navigation_bar.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/home_body_view.dart';
import 'package:glowvana/feature/home/presentation/view_model/cubit/routine_steps_cubit.dart';
import 'package:glowvana/feature/masks/presentation/view/mask_view.dart';
import 'package:glowvana/feature/profile/presentation/view/profile_view.dart';
import 'package:glowvana/feature/tracking/presentation/view/tracker_view.dart';
import 'package:glowvana/feature/tracking/presentation/view_model/cubit/tracker_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.routineModel});
  final RoutineModel? routineModel;
  @override
  State<HomeView> createState() => _HomeViewState();
}

final UserSettingsStorage userSettingsStorage =
    getIt.get<UserSettingsStorage>();

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  late final List<Widget> screens;
  late RoutineTrackerCubit routineTrackerCubit;
  @override
  void initState() {
    super.initState();
    final skinType = userSettingsStorage.getSkinType();
final routineType = userSettingsStorage.getRoutineType();

    context.read<RoutineStepsCubit>().getRoutineSteps(skinType, routineType);
    routineTrackerCubit = getIt.get<RoutineTrackerCubit>();
     routineTrackerCubit.loadRoutine(skinType: skinType, routineType: routineType);
    screens = [
      HomeBodyView(routineModel: widget.routineModel),
      const MaskView(),
      const TrackerView(),
      const ProfileView(),

    ];
  }


  @override
Widget build(BuildContext context) {
  return BlocListener<RoutineStepsCubit, RoutineStepsState>(
    listener: (context, state) {
      if (state is RoutineStepsSuccess) {
        final routineType = context.read<RoutineStepsCubit>().currentRoutine;
        final skinType = userSettingsStorage.getSkinType();
        routineTrackerCubit.loadRoutine(skinType: skinType, routineType: routineType);
      }
    },
    child: SafeArea(
      child: Scaffold(
        extendBody: true,
        body: currentIndex == 2
            ? BlocProvider.value(
                value: routineTrackerCubit,
                child: const TrackerView(),
              )
            : screens[currentIndex],
        bottomNavigationBar: GlassBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    ),
  );
}

  }
