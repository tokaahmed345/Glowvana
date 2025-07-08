import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/data/repos/home_repo.dart';

part 'routine_steps_state.dart';

class RoutineStepsCubit extends Cubit<RoutineStepsState> {
  RoutineStepsCubit(this.repo) : super(RoutineStepsInitial());
 final HomeRepo repo;
 String currentRoutine ='morning';
  Future<void>getRoutineSteps(String skinType,String routineType)async{
    emit(RoutineStepsLoading());
  currentRoutine=routineType;
final data= await repo.fetchRoutineSteps(skinType: skinType, routineType: routineType);
  data.fold((fail)=>emit(RoutineStepsFailure(errorMessage: fail.message)), (steps)=>emit(RoutineStepsSuccess(steps)));
  }
}
