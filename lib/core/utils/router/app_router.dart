import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/app_screens/app_screens.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/feature/Auth/presentation/view/log_in.dart';
import 'package:glowvana/feature/Auth/presentation/view/sing_up.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/login_cubit/log_in_cubit.dart';
import 'package:glowvana/feature/Auth/presentation/view_model/auth_cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:glowvana/feature/home/data/models/routine_model.dart';
import 'package:glowvana/feature/home/presentation/view/home_view.dart';
import 'package:glowvana/feature/home/presentation/view/routine_step_details.dart';
import 'package:glowvana/feature/home/presentation/view_model/cubit/routine_steps_cubit.dart';
import 'package:glowvana/feature/onboarding/presentation/view/onboarding_view.dart';
import 'package:glowvana/feature/onboarding/presentation/view/widgets/page_view_on_boarding.dart';
import 'package:glowvana/feature/skin_identifier/presentation/view/skin_identifier_view.dart';
import 'package:glowvana/feature/skin_identifier/presentation/view_model/cubits/cubit/detect_and_pick_image.dart';
import 'package:glowvana/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    redirect: (context, state) {
      final user = getIt.get<FirebaseAuth>().currentUser;
      final loggingIn = state.fullPath == AppScreens.logIn ||
          state.fullPath == AppScreens.signUp ||
          state.fullPath == AppScreens.splash ||
          state.fullPath == AppScreens.onBoarding ||
          state.fullPath == AppScreens.skinIdentifier ||

          state.fullPath == AppScreens.pageView;

      if (user == null && !loggingIn) {
        return AppScreens.splash;
      }

      if (user != null && state.fullPath == AppScreens.splash) {
        return AppScreens.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppScreens.onBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: AppScreens.pageView,
        builder: (context, state) => const OnBoardingPageViewBody(),
      ),
      GoRoute(
        path: AppScreens.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppScreens.skinIdentifier,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<PickAndDetectImage>(),
          child: const SkinIdentifierView(),
        ),
      ),
      GoRoute(
        path: AppScreens.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<SignUpCubit>(),
          child: const SingUpView(),
        ),
      ),
      GoRoute(
        path: AppScreens.logIn,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<LogInCubit>(),
          child: const LogInView(),
        ),
      ),
      GoRoute(
          path: AppScreens.home,
          builder: (context, state) => BlocProvider(
                create: (context) => getIt.get<RoutineStepsCubit>(),
                child: const HomeView(),
              )),
      GoRoute(
        path: AppScreens.routineDetails,
        builder: (context, state) {
          final steps = state.extra as RoutineModel;
          return BlocProvider(
            create: (context) => getIt.get<RoutineStepsCubit>(),
            child: RoutineStepDetailsView(
              routineModel: steps,
            ),
          );
        },
      ),
    ],
  );
}
