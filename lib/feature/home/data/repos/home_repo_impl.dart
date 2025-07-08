import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:glowvana/core/utils/firebasefailure/firebase_failure.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/data/repos/home_repo.dart';

class HomeRepoImpl  extends HomeRepo{
 FirebaseFirestore firestore;
 HomeRepoImpl(this.firestore);

  @override
  Future<Either<FirebaseErrorHandler, List<RoutineModel>>> fetchRoutineSteps({required String skinType, required String routineType}) async{
try {

  final snapshot= await firestore.collection('skin_routines').where('skinType',isEqualTo:skinType).where('routineType',isEqualTo:routineType).orderBy('stepOrder').get();
  
    return right(snapshot.docs.map((docs)=>RoutineModel.fromJson(docs.id, docs.data())).toList()) ;
} on FirebaseException catch (e) {
return left(FirebaseErrorHandler(e.code));
}catch(e){
return left(FirebaseErrorHandler(e.toString()));
}
  
  
  
  
  
   }

}