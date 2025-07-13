import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/helpers/user_setting_storage/hive_helper.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/tracking/data/repos/tracker_repo_impl.dart';
import 'package:glowvana/feature/tracking/presentation/view_model/cubit/tracker_state.dart';

class RoutineTrackerCubit extends Cubit<RoutineTrackerState> {
  final TrackerRepo routineRepo;

  RoutineTrackerCubit(this.routineRepo) : super(RoutineTrackerInitial());
Future<void> loadRoutine({
  required String skinType,
  required String routineType,
}) async {
  final result = await routineRepo.fetchRoutine(
    skinType: skinType,
    routineType: routineType,
  );

  result.fold(
    (failure) => emit(RoutineTrackerFailure(failure.message)),
    (steps) async {
      final now = DateTime.now();
      final lastDate = getIt<UserSettingsStorage>().getToday();

      bool isNewDay = lastDate == null ||
          now.year != lastDate.year ||
          now.month != lastDate.month ||
          now.day != lastDate.day;

      if (isNewDay) {
        for (var step in steps) {
          if (step.isDone) {
            routineRepo.updateStepDone(docId: step.docId, isDone: false);
          }
        }
         getIt.get<UserSettingsStorage>().setMaskUsedToday(false); 

        final resetSteps = steps.map((e) => e.copyWith(isDone: false)).toList();
        emit(RoutineTrackerSuccess(resetSteps,maskUsed: false));
        await getIt.get<UserSettingsStorage>().saveLastRoutine(now);
      } else {
          final maskUsed =   getIt.get<UserSettingsStorage>().getMaskUsedToday(); // 👈 Load saved value

        emit(RoutineTrackerSuccess(steps,maskUsed: maskUsed));
      }
    },
  );
}


  Future<void> toggleStep(RoutineModel step) async {
    if (state is! RoutineTrackerSuccess) return;
final currentState = state as RoutineTrackerSuccess;
    final current = (state as RoutineTrackerSuccess).steps;
    final updated = step.copyWith(isDone: !step.isDone);
    final index = current.indexWhere((e) => e.docId == step.docId);
    if (index == -1) return;

    final updatedList = [...current];
    updatedList[index] = updated;
    emit(RoutineTrackerSuccess(updatedList,maskUsed: currentState.maskUsed));

    final result = await routineRepo.updateStepDone(
      docId: step.docId,
      isDone: updated.isDone,
    );

    result.fold(
      (failure) => emit(RoutineTrackerFailure(failure.message)),
      (_) {},
    );
  }
  void toggleMaskUsage(bool value) {
  if (state is RoutineTrackerSuccess) {
    final current = state as RoutineTrackerSuccess;
        getIt<UserSettingsStorage>().setMaskUsedToday(value); 

    emit(RoutineTrackerSuccess(current.steps, maskUsed: value));
  }
}


}
