import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'core/resources/app_images.dart';
import 'core/utils/navigator.dart';
import 'presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController animationController;
  final animationDuration = const Duration(milliseconds: 2500);

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: animationDuration);
    navigate();
    super.initState();
  }


  navigate() async{
    await Future.delayed(animationDuration);
    pushReplacement(const HomeScreen());
  }


  @override
  void dispose() {
    animationController.removeListener(() { });
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppImages.splashAnimation,
          repeat: false,
          controller: animationController,
          onLoaded: (composition) {
            animationController.forward();
          },
        ),
      ),
    );
  }
}
