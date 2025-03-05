import 'package:a_village/common/widgets/app_button.dart';
import 'package:a_village/common/widgets/matched_animation.dart';
import 'package:a_village/utils/constants/app_fonts.dart';
import 'package:a_village/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants/image_strings.dart';

class YouMatchedScreen extends StatefulWidget {
  const YouMatchedScreen({super.key});

  @override
  State<YouMatchedScreen> createState() => _YouMatchedScreenState();
}

class _YouMatchedScreenState extends State<YouMatchedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageStrings.heartsgroup),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff2353FF),
              Color(0xffCD75FF),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Text(
                    'You Matched!',
                    style: TextStyle(
                      color: TColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      fontFamily: AppFonts.interbold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      'You and Leslie have liked each other',
                      style: TextStyle(
                        fontSize: 15,
                        color: TColors.white,
                        fontFamily: AppFonts.interregular,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 315,
                    child: MatchedAnimation(),
                  ),
                  AppButton2(
                    title: AppLocalizations.of(context)!.sendmssg,
                    onTap: () {},
                    color: TColors.secondary,
                    textColor: TColors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppButton2(
                    title: AppLocalizations.of(context)!.keepplay,
                    onTap: () {},
                    color: TColors.black,
                    textColor: TColors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
