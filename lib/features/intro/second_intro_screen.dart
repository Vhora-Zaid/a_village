import 'package:a_village/common/widgets/cards_intro.dart';
import 'package:a_village/features/intro/third_intro_screen.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';

class SecondIntroScreen extends StatefulWidget {
  const SecondIntroScreen({super.key, required Null Function() onNext});

  @override
  State<SecondIntroScreen> createState() => _SecondIntroScreenState();
}

class _SecondIntroScreenState extends State<SecondIntroScreen> {
  int activeIndex = 1;

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
                AppLocalizations.of(context)!.intro2,
                style: TextStyle(
                    fontFamily: AppFonts.interbold,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 350,
                child: AnimatedIntroScreen(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 85, bottom: 49),
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
