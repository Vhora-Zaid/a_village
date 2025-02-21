import 'package:a_village/common/widgets/language_container.dart';
import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Language',
                style: TextStyle(fontFamily: AppFonts.bold, fontSize: 30),
              ),
              const SizedBox(height: 35),
              LanguageContainer.container(
                imagePath: ImageStrings.englishLanguageLogo,
                text: 'English',
                textColor: Colors.white,
                width: 325,
                height: 145,
                color: TColors.primary,
              ),
              const SizedBox(height: 9),
              LanguageContainer.container(
                imagePath: ImageStrings.chineseLanguageLogo,
                text: 'Chinese',
                textColor: Colors.black,
                width: 325,
                height: 145,
                color: TColors.secondary,
              ),
              const SizedBox(height: 23),
              Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppFonts.regular,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}