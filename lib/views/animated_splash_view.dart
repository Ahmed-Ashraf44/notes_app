import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class AnimatedSplashView extends StatelessWidget {
  const AnimatedSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 200,
      backgroundColor: Colors.white,
      splash: const CircleAvatar(
        radius: 90,
        backgroundImage: AssetImage(
          'assets/images/splash.jpg',
        ),
      ),
      nextScreen: const NotesView(),
    );
  }
}
