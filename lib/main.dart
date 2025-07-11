import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowvana/core/utils/router/app_router.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/core/utils/helpers/user_setting_storage/hive_helper.dart';
import 'package:glowvana/core/utils/theme/app_theme.dart';
import 'package:glowvana/core/utils/theme/theme_cubit/theme_cubit.dart';
import 'package:glowvana/firebase_options.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUp();
  await Hive.initFlutter();

  await Hive.openBox(UserSettingsStorage.boxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, Brightness>(
        builder: (context, state) {
          final theme=state==Brightness.light?AppTheme.morningTheme:AppTheme.nightTheme;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: theme,
          );
        },
      ),
    );
  }
}
