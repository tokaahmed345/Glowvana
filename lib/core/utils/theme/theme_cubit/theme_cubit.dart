import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:glowvana/core/utils/helpers/user_setting_storage/hive_helper.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/feature/tracking/presentation/view_model/cubit/tracker_cubit.dart';
import 'package:glowvana/feature/home/presentation/view_model/cubit/routine_steps_cubit.dart';

class ThemeCubit extends Cubit<Brightness> {
  ThemeCubit() : super(_getInitialTheme()) {
    _syncRoutineWithTheme();
  }

  static Brightness _getInitialTheme() {
    final routineType = getIt<UserSettingsStorage>().getRoutineType();
    return routineType == 'night' ? Brightness.dark : Brightness.light;
  }

  final userSettings = getIt<UserSettingsStorage>();
  final trackerCubit = getIt<RoutineTrackerCubit>();

  void switchToMorning() {
    emit(Brightness.light);
    _updateRoutineType("morning");
  }

  void switchToNight() {
    emit(Brightness.dark);
    _updateRoutineType("night");
  }

  void _updateRoutineType(String type) {
    userSettings.saveRoutineType(type);

    final skinType = userSettings.getSkinType();
    trackerCubit.loadRoutine(skinType: skinType, routineType: type);
    getIt<RoutineStepsCubit>().getRoutineSteps(skinType, type);
  }

  void _syncRoutineWithTheme() {
    final type = userSettings.getRoutineType();
    final skinType = userSettings.getSkinType();

    trackerCubit.loadRoutine(skinType: skinType, routineType: type);
    getIt<RoutineStepsCubit>().getRoutineSteps(skinType, type);
  }
}
