import 'package:equatable/equatable.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';

class RoutineTrackerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RoutineTrackerInitial extends RoutineTrackerState {}

class RoutineTrackerLoading extends RoutineTrackerState {}

class RoutineTrackerSuccess extends RoutineTrackerState {
  final List<RoutineModel> steps;
    final bool maskUsed;
  RoutineTrackerSuccess(this.steps, { this.maskUsed=false});

  double get progress => steps.isEmpty
      ? 0
      : steps.where((step) => step.isDone).length / steps.length;

  @override
  List<Object?> get props => [steps,maskUsed];
}

class RoutineTrackerFailure extends RoutineTrackerState {
  final String message;
  RoutineTrackerFailure(this.message);

  @override
  List<Object?> get props => [message];
}