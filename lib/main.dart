import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/router/app_router.dart';
import 'package:glowvana/core/utils/service_locator/service_locator.dart';
import 'package:glowvana/core/utils/theme/app_theme.dart';
import 'package:glowvana/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: AppTheme.themeData,
     
    
    );
  }
}
