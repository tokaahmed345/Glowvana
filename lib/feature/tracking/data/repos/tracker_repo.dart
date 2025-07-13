import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:glowvana/core/utils/firebasefailure/firebase_failure.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/tracking/data/repos/tracker_repo_impl2.dart';

class TrackerRepoImpl implements TrackerRepo {
  final FirebaseFirestore firestore;

  TrackerRepoImpl(this.firestore);
  @override
  Future<Either<FirebaseErrorHandler, List<RoutineModel>>> fetchRoutine({required String skinType, required String routineType})async {
 try {
  final snapshot= await firestore.collection('skin_routines').where('skinType', isEqualTo: skinType)
           .where('routineType', isEqualTo: routineType)
           .orderBy('stepOrder')
           .get();
  
  return right( snapshot.docs.map((doc)=>RoutineModel.fromJson(doc.id, doc.data())).toList());
} on FirebaseException catch (e) {
return left(FirebaseErrorHandler(e.code));
}catch(e){
  return left(FirebaseErrorHandler(e.toString()));
}

  }

  @override
  Future<Either<FirebaseErrorHandler, void>> updateStepDone({required String docId, required bool isDone})async {
try {
  await firestore.collection('skin_routines').doc(docId).update({'isDone':isDone});
      return right(null);

}  catch (e) {
return left(FirebaseErrorHandler(e.toString()));
}
  }
  
}
