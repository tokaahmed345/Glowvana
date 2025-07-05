import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:glowvana/feature/Auth/data/repo/auth_repo.dart';
import 'package:glowvana/feature/Auth/data/repo/auth_repo_impl.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/login_cubit/log_in_cubit.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/sign_up_cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;
void setUp(){
  getIt.registerLazySingleton<FirebaseAuth>(()=>FirebaseAuth.instance);
  getIt.registerLazySingleton<AuthRepo>(()=>AuthRepoImpl(getIt.get<FirebaseAuth>()));
  getIt.registerFactory<SignUpCubit>(()=>SignUpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<LogInCubit>(()=>LogInCubit(getIt.get<AuthRepo>()));

}
