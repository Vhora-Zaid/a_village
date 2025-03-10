import 'dart:async';
import 'package:a_village/features/intro/first_intro_screen.dart';
import 'package:a_village/features/intro/intro_screen.dart';
import 'package:a_village/features/intro/select_language_screen.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: TColors.mainGradient,
        ),
        child: Center(
          child: Image.asset(
            ImageStrings.splashLogo,
            height: 162,
            width: 176.5,
          ),
        ),
      ),
    );
  }
}
