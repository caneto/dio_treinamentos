import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class SplashScreenDelayPage extends StatefulWidget {
  const SplashScreenDelayPage({super.key});

  @override
  State<SplashScreenDelayPage> createState() => _SplashScreenDelayPageState();
}

class _SplashScreenDelayPageState extends State<SplashScreenDelayPage> {
  openHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    openHome();
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red,
              Colors.purple,
            ],
            stops: [
              0.3,
              0.7,
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 200,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Bem Vindo\nMundo',
                  textStyle: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 10,
              pause: const Duration(milliseconds: 160),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
        ),
      ),
    ));
  }
}
