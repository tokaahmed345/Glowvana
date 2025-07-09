import 'package:dartz/dartz.dart';
import 'package:glowvana/core/utils/firebasefailure/firebase_failure.dart';
import 'package:glowvana/feature/masks/data/models/mask_skin_model.dart';

abstract class MaskRepo {
Future <Either<FirebaseErrorHandler,List<MasksSkin>>> fetchMasks({required String skinType});

}