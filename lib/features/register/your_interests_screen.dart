import 'package:a_village/common/widgets/interest_selection.dart';
import 'package:a_village/features/register/set_preferences_screen.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/app_appbar.dart';
import '../../common/widgets/app_button.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/app_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/constants/image_strings.dart';

class YourInterestsScreen extends StatefulWidget {
  const YourInterestsScreen({super.key});

  @override
  State<YourInterestsScreen> createState() => _YourInterestsScreenState();
}

class _YourInterestsScreenState extends State<YourInterestsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      appBar: MyAppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              ImageStrings.backarrow,
              height: 44,
              width: 44,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.yourinterests,
                style: TextStyle(
                  color: TColors.black,
                  fontFamily: AppFonts.interbold,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                AppLocalizations.of(context)!.lorem,
                style: TextStyle(
                  fontFamily: AppFonts.interregular,
                  fontSize: 14,
                  color: Color(0xff6F778B),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              InterestSelection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 10),
        child: AppButton(
          title: AppLocalizations.of(context)!.save,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SetPreferencesScreen()));
          },
        ),
      ),
    );
  }
}