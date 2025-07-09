import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:glowvana/core/utils/firebasefailure/firebase_failure.dart';
import 'package:glowvana/feature/masks/data/models/mask_skin_model.dart';
import 'package:glowvana/feature/masks/data/repos/mask_repo.dart';

class MaskRepoImpl  extends MaskRepo{
  FirebaseFirestore firestore;
  MaskRepoImpl(this.firestore);
  @override
  Future<Either<FirebaseErrorHandler, List<MasksSkin>>> fetchMasks({required String skinType})async {
 
try {
  final snapshot= await firestore.collection('masks').where('skinType',isEqualTo: skinType).get();
  return right(snapshot.docs.map((doc)=>MasksSkin.fromJson(doc.id, doc.data())).toList());
} on FirebaseException catch (e) {
return Left(FirebaseErrorHandler(e.code));
} catch(e){
return left(FirebaseErrorHandler(e.toString()));
}
  }

}