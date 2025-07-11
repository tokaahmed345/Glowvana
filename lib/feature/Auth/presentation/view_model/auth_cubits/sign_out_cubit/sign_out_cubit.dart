import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glowvana/feature/Auth/data/repo/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.authRepo) : super(SignOutInitial());
 final  AuthRepo authRepo;
  Future<void>signOut()async{
emit(SignOutLaoding());

final result=await authRepo.signOut();
 result.fold((fail)=>emit(SignOutFailure(errorMessage:fail.message)), (_)=>emit(SignOutSuccess()));

  }
}
