part of 'routine_steps_cubit.dart';

sealed class RoutineStepsState extends Equatable {
  const RoutineStepsState();

  @override
  List<Object> get props => [];
}

final class RoutineStepsInitial extends RoutineStepsState {}
final class RoutineStepsLoading extends RoutineStepsState {}
final class RoutineStepsSuccess extends RoutineStepsState {
  final List<RoutineModel>routines;

 const  RoutineStepsSuccess(this.routines);
}
final class RoutineStepsFailure extends RoutineStepsState {
  final String errorMessage;

 const  RoutineStepsFailure({required this.errorMessage});

}
