import 'package:flutter/material.dart';
import 'package:sigma_tech_task/splash.dart';

import 'core/utils/navigator.dart';
import 'presentation/helper/glow_remover.dart';
import 'presentation/helper/screen_util_init.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenInit(
      builder: (context, child) {
        return MaterialApp(
          title: 'Sigma Tech',
          builder: glowRemover,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
