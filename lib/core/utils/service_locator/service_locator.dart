import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:glowvana/core/utils/storage/hive_helper.dart';
import 'package:glowvana/core/utils/theme/theme_cubit/theme_cubit.dart';
import 'package:glowvana/feature/Auth/data/repo/auth_repo.dart';
import 'package:glowvana/feature/Auth/data/repo/auth_repo_impl.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/login_cubit/log_in_cubit.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:glowvana/feature/home/data/helpers/cashe_image_hive.dart';
import 'package:glowvana/feature/home/data/repos/home_repo.dart';
import 'package:glowvana/feature/home/data/repos/home_repo_impl.dart';
import 'package:glowvana/feature/home/presentation/view_model/cubit/routine_steps_cubit.dart';
import 'package:glowvana/feature/skin_identifier/presentation/view_model/cubits/cubit/detect_and_pick_image.dart';

final getIt = GetIt.instance;
void setUp(){
  getIt.registerLazySingleton<FirebaseAuth>(()=>FirebaseAuth.instance);
  getIt.registerLazySingleton<AuthRepo>(()=>AuthRepoImpl(getIt.get<FirebaseAuth>()));
  getIt.registerFactory<SignUpCubit>(()=>SignUpCubit(getIt.get<AuthRepo>()));
  getIt.registerFactory<LogInCubit>(()=>LogInCubit(getIt.get<AuthRepo>()));
getIt.registerLazySingleton(()=>FirebaseFirestore.instance);
getIt.registerLazySingleton<HomeRepo>(()=>HomeRepoImpl(getIt.get<FirebaseFirestore>()));
getIt.registerFactory<RoutineStepsCubit>(()=>RoutineStepsCubit(getIt.get<HomeRepo>()));
getIt.registerLazySingleton<UserSettingsStorage>(()=>UserSettingsStorage());
getIt.registerFactory(() => PickAndDetectImage(getIt<UserSettingsStorage>()));

getIt.registerLazySingleton<ImageCaching>(()=>ImageCaching());
getIt.registerLazySingleton<ThemeCubit>(()=>ThemeCubit());
}
