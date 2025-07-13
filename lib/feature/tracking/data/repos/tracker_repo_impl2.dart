import 'package:dartz/dartz.dart';
import 'package:glowvana/core/utils/firebasefailure/firebase_failure.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';

abstract class TrackerRepo {
 Future<Either<FirebaseErrorHandler,List<RoutineModel>>>fetchRoutine({required String skinType,required String routineType});
 Future<Either<FirebaseErrorHandler,void>>updateStepDone({required String docId,required bool isDone});




}
