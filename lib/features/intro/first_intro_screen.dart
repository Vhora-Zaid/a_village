import 'package:a_village/common/widgets/bubbles_intro.dart';
import 'package:a_village/features/intro/second_intro_screen.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';

class FirstIntroScreen extends StatefulWidget {
  const FirstIntroScreen({super.key, required Null Function() onNext});

  @override
  State<FirstIntroScreen> createState() => _FirstIntroScreenState();
}

class _FirstIntroScreenState extends State<FirstIntroScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.intro1,
                style: TextStyle(
                  fontFamily: AppFonts.interbold,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 430,
                child: Stack(
                  children: [
                    BubbleAnimationScreen(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Text(
                  AppLocalizations.of(context)!.lorem,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
