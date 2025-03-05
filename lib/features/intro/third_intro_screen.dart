import 'package:a_village/common/widgets/hearts_Intro.dart';
import 'package:a_village/features/login/login_screen.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';

class ThirdIntroScreen extends StatefulWidget {
  const ThirdIntroScreen({super.key, required Null Function() onDone});

  @override
  State<ThirdIntroScreen> createState() => _ThirdIntroScreenState();
}

class _ThirdIntroScreenState extends State<ThirdIntroScreen> {
  int activeIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.intro3,
              style: TextStyle(
                  fontFamily: AppFonts.interbold,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 350,
              width: 250,
              child: HeartsIntro(),
            ),
            SizedBox(
              height: 37,
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
    );
  }
}
