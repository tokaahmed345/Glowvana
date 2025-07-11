import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glowvana/core/utils/helpers/user_setting_storage/hive_helper.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/data/repos/home_repo.dart';
import 'package:glowvana/feature/tracking/presentation/view_model/cubit/tracker_cubit.dart';

part 'routine_steps_state.dart';

class RoutineStepsCubit extends Cubit<RoutineStepsState> {
  RoutineStepsCubit(this.repo) : super(RoutineStepsInitial());
 final HomeRepo repo;
 String routineType='morning';
 String currentRoutine =getIt.get<UserSettingsStorage>().getSkinType();
//   Future<void>getRoutineSteps(String skinType,String routineType)async{
//     emit(RoutineStepsLoading());
//   currentRoutine=routineType;
// final data= await repo.fetchRoutineSteps(skinType: skinType, routineType: routineType);
//   data.fold((fail)=>emit(RoutineStepsFailure(errorMessage: fail.message)), (steps)=>emit(RoutineStepsSuccess(steps)));
//   }
//   void changeRoutineType(String newType) async {
//   routineType = newType.toLowerCase();
//   await getIt<UserSettingsStorage>().saveRoutineType(routineType);

//   final skinType = getIt<UserSettingsStorage>().getSkinType();

//   getRoutineSteps(skinType, routineType); // حملي الخطوات الجديدة

//   /// 💡 كمان: لو TrackerCubit موجود، حمّلي الروتين الخاص بيه
//   final trackerCubit = getIt<RoutineTrackerCubit>();
//   trackerCubit.loadRoutine(skinType: skinType, routineType: routineType);
// }
Future<void> getRoutineSteps(String skinType, String routineType) async {
  emit(RoutineStepsLoading());
  currentRoutine = routineType.toLowerCase();
  final data = await repo.fetchRoutineSteps(skinType: skinType, routineType: routineType);
  data.fold(
    (fail) => emit(RoutineStepsFailure(errorMessage: fail.message)),
    (steps) => emit(RoutineStepsSuccess(steps))
  );
}

// void changeRoutineType(String newType) async {
//   routineType = newType.toLowerCase();
//   await getIt<UserSettingsStorage>().saveRoutineType(routineType);

//   final skinType = getIt<UserSettingsStorage>().getSkinType();

//   getRoutineSteps(skinType, routineType); // حملي الخطوات الجديدة

//   final trackerCubit = getIt<RoutineTrackerCubit>();
//   trackerCubit.loadRoutine(skinType: skinType, routineType: routineType);
// }

}
