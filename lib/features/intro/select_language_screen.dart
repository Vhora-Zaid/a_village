import 'package:a_village/common/widgets/language_container.dart';
import 'package:a_village/features/intro/intro_screen.dart';
import 'package:a_village/providers/language_provider.dart';
import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:a_village/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.selectLanguage,
              style: TextStyle(
                fontFamily: AppFonts.interbold,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 35),

            LanguageContainer.container(
              onTap: () {
                Provider.of<AppLanguageProvider>(context, listen: false)
                    .changeLanguage(const Locale('en'));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroScreen()),
                );
              },
              imagePath: ImageStrings.englishLanguageLogo,
              text: 'English',
              textColor: Colors.white,
              height: 145,
              color: TColors.primary,
            ),
            const SizedBox(height: 9),

            LanguageContainer.container(
              onTap: () {
                Provider.of<AppLanguageProvider>(context, listen: false)
                    .changeLanguage(const Locale('zh'));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroScreen()),
                );
              },
              imagePath: ImageStrings.chineseLanguageLogo,
              text: AppLocalizations.of(context)!.chinese,
              textColor: Colors.black,
              height: 145,
              color: TColors.secondary,
            ),
            const SizedBox(height: 23),

            Text(
              AppLocalizations.of(context)!.lorem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.interregular,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
