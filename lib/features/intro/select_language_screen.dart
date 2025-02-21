import 'package:a_village/common/widgets/language_container.dart';
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
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Language',
                style: TextStyle(fontFamily: 'Inter Tight', fontSize: 30),
              ),
              SizedBox(
                height: 35,
              ),
              LanguageContainer.container(
                imagePath: ImageStrings.englishLanguageLogo,
                text: 'English',
                width: 325,
                height: 145,
                color: TColors.primary,
              ),
              SizedBox(
                height: 9,
              ),
              LanguageContainer.container(
                imagePath: ImageStrings.chineseLanguageLogo,
                text: 'Chinese',
                width: 325,
                height: 145,
                color: TColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
