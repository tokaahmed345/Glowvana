import 'package:dartz/dartz.dart';
import 'package:glowvana/core/utils/firebasefailure/firebase_failure.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';

abstract class HomeRepo {
  Future<Either<FirebaseErrorHandler,List<RoutineModel>>>fetchRoutineSteps({required String skinType,required String routineType });
}