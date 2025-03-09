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
        width: double.infinity,
        height: double.infinity,
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.02,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You Matched!',
                  style: TextStyle(
                    color: TColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.sizeOf(context).width * 0.09,
                    fontFamily: AppFonts.interbold,
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Text(
                    'You and Leslie have liked each other',
                    style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).width * 0.04,
                      color: TColors.white,
                      fontFamily: AppFonts.interregular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: MatchedAnimation(),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                AppButton2(
                  title: AppLocalizations.of(context)!.sendmssg,
                  onTap: () {},
                  color: TColors.secondary,
                  textColor: TColors.black,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                AppButton2(
                  title: AppLocalizations.of(context)!.keepplay,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: TColors.black,
                  textColor: TColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
