import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glowvana/core/utils/firebasefailure/firebase_failure.dart';
import 'package:glowvana/feature/Auth/data/model/auth_model.dart';
import 'package:glowvana/feature/Auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth _firebaseAuth;

  AuthRepoImpl(this._firebaseAuth);

  @override
  Future<Either<FirebaseErrorHandler, AuthModel>> logIn(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return right(AuthModel.fromFirebaseAuth(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseErrorHandler.fromCode(e.code));
    } catch (e) {
      return left(FirebaseErrorHandler('error happened :${e.toString()}'));
    }
  }

  @override
  Future<Either<FirebaseErrorHandler, AuthModel>> signUp(
      String email, String password, String userName) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(userName);
      await userCredential.user?.reload();
      final updateUser = _firebaseAuth.currentUser!;
      return right(AuthModel.fromFirebaseAuth(updateUser));
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseErrorHandler.fromCode(e.code));
    } catch (e) {
      return Left(FirebaseErrorHandler("unexpected Error: ${e.toString()}"));
    }
  }
}
