import 'package:a_village/features/intro/second_intro_screen.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants/app_fonts.dart';
import '../../utils/constants/colors.dart';

class FirstIntroScreen extends StatefulWidget {
  const FirstIntroScreen({super.key});

  @override
  State<FirstIntroScreen> createState() => _FirstIntroScreenState();
}

class _FirstIntroScreenState extends State<FirstIntroScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 30, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 20,
                      height: 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: activeIndex == index
                            ? Color(0xff2353FF)
                            : Color(0xffD9D9D9),
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondIntroScreen(),
                  ),
                );
              },
              child: Image.asset(
                ImageStrings.nextbutton,
                height: 58,
                width: 58,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.intro1,
                style: TextStyle(
                    fontFamily: AppFonts.interbold,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 37,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
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
