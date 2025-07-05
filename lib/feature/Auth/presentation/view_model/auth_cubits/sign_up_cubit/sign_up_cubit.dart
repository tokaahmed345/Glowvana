import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glowvana/feature/Auth/data/model/auth_model.dart';
import 'package:glowvana/feature/Auth/data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.repo) : super(SignUpInitial());

final AuthRepo repo;
Future<void>register(String email,String password,String username) async{
emit(SignUpLoading());
final res =await repo.signUp(email, password, username);
res.fold((fail)=> emit(SignUpFailure(errorMessage: fail.message)), (users)=>emit(SignUpSuccess(users)));
}

}
