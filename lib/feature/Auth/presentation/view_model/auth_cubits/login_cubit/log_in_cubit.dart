import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glowvana/feature/Auth/data/model/auth_model.dart';
import 'package:glowvana/feature/Auth/data/repo/auth_repo.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.repo) : super(LogInInitial());
final AuthRepo repo;
  Future<void>logIn(String email,String password)async{
    emit(LogInLoading());
 final data=   await repo.logIn(email, password);
 data.fold((fail)=> emit(LogInFailure(errorMessage: fail.message)), (users)=>emit(LogInSuccess(users)));
  }
}
