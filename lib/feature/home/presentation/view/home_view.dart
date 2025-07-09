
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/core/utils/helpers/user_setting_storage/hive_helper.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/bottom_navigation_bar.dart';
import 'package:glowvana/feature/home/presentation/view/widgets/home_body_view.dart';
import 'package:glowvana/feature/home/presentation/view_model/cubit/routine_steps_cubit.dart';
import 'package:glowvana/feature/masks/presentation/view/mask_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.routineModel});
  final RoutineModel? routineModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

final UserSettingsStorage userSettingsStorage = getIt.get<UserSettingsStorage>();

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    loadInRoutine();
    screens = [
      HomeBodyView(routineModel: widget.routineModel),
   const MaskView(),
      // JuicesView(),
      // TrackerView(),
    ];
  }

  void loadInRoutine() {
    final skinType = userSettingsStorage.getSkinType();
    context.read<RoutineStepsCubit>().getRoutineSteps(skinType, 'morning');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true, 
        body: screens[currentIndex],
        bottomNavigationBar: GlassBottomNavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

