import 'package:dartz/dartz.dart';
import 'package:glowvana/core/utils/firebasefailure/firebase_failure.dart';
import 'package:glowvana/feature/Auth/data/model/auth_model.dart';

abstract class AuthRepo {
Future<Either<FirebaseErrorHandler,AuthModel>>signUp(String email,String password,String userName);
Future<Either<FirebaseErrorHandler,AuthModel>>logIn(String email,String password);

}